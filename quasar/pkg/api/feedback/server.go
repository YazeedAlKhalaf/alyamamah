package feedback

import (
	"context"

	feedbackpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/api/feedback/proto"
	feedbacksvcpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/quasarmetadata"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/users"
	"github.com/rs/zerolog/log"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type server struct {
	feedbackpb.UnimplementedFeedbackServer

	feedbackSvc    feedbacksvcpb.FeedbackSvcServer
	quasarmetadata quasarmetadata.QuasarMetadata
	usersSvc       users.Service
}

func (s *server) GetFeedbackCategories(ctx context.Context, r *feedbackpb.GetFeedbackCategoriesRequest) (*feedbackpb.GetFeedbackCategoriesResponse, error) {
	resp, err := s.feedbackSvc.SvcGetFeedbackCategories(ctx, &feedbacksvcpb.SvcGetFeedbackCategoriesRequest{})
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback categories")
		return nil, err
	}

	fcs := make([]*feedbackpb.FeedbackCategory, len(resp.Categories))
	for i := range resp.Categories {
		fcs[i] = mapSvcFeedbackCategoryToPbFeedbackCategory(resp.Categories[i])
	}

	return &feedbackpb.GetFeedbackCategoriesResponse{
		Categories: fcs,
	}, nil
}

func (s *server) CreateFeedback(ctx context.Context, r *feedbackpb.CreateFeedbackRequest) (*feedbackpb.CreateFeedbackResponse, error) {
	_, err := s.feedbackSvc.SvcCreateFeedback(ctx, &feedbacksvcpb.SvcCreateFeedbackRequest{
		Title:      r.Title,
		Body:       r.Body,
		CategoryId: r.CategoryId,
	})
	if err != nil {
		return nil, err
	}

	return &feedbackpb.CreateFeedbackResponse{}, nil
}

func (s *server) GetFeedback(ctx context.Context, r *feedbackpb.GetFeedbackRequest) (*feedbackpb.GetFeedbackResponse, error) {
	var fis []*feedbackpb.FeedbackItem
	if r.Id == nil {
		claims, ok := s.quasarmetadata.GetClaims(ctx)
		if !ok {
			log.Ctx(ctx).Error().Msg("couldn't get claims")
			return nil, status.Error(codes.Internal, "internal error")
		}

		user, err := s.usersSvc.GetUserByUsername(ctx, claims.Payload.Username)
		if err != nil {
			log.Ctx(ctx).Err(err).Msg("couldn't get user")
			return nil, err
		}

		resp, err := s.feedbackSvc.SvcGetFeedbackByUserId(ctx, &feedbacksvcpb.SvcGetFeedbackByUserIdRequest{
			UserId: user.ID,
		})
		if err != nil {
			log.Ctx(ctx).Err(err).Msg("couldn't get feedback")
			return nil, err
		}

		fis = make([]*feedbackpb.FeedbackItem, len(resp.FeedbackItems))
		for _, fi := range resp.FeedbackItems {
			fis = append(fis, mapSvcFeedbackItemToPbFeedbackItem(fi))
		}
	} else {
		resp, err := s.feedbackSvc.SvcGetFeedbackById(ctx, &feedbacksvcpb.SvcGetFeedbackByIdRequest{
			Id: *r.Id,
		})
		if err != nil {
			log.Ctx(ctx).Err(err).Msg("couldn't get feedback")
			return nil, err
		}

		fis = make([]*feedbackpb.FeedbackItem, 1)
		fis = append(fis, mapSvcFeedbackItemToPbFeedbackItem(resp.FeedbackItem))
	}

	return &feedbackpb.GetFeedbackResponse{
		FeedbackItems: fis,
	}, nil
}

func NewServer(feedbackSvc feedbacksvcpb.FeedbackSvcServer, quasarmetadata quasarmetadata.QuasarMetadata, usersSvc users.Service) feedbackpb.FeedbackServer {
	return &server{
		feedbackSvc:    feedbackSvc,
		quasarmetadata: quasarmetadata,
		usersSvc:       usersSvc,
	}
}
