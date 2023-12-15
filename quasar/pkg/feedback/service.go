package feedbacksvc

import (
	"context"

	feedbacksvcpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/store"
	"github.com/google/uuid"
	"github.com/rs/zerolog/log"
)

type service struct {
	feedbacksvcpb.UnimplementedFeedbackSvcServer

	store store.Store
}

func (s *service) SvcCreateFeedback(ctx context.Context, r *feedbacksvcpb.SvcCreateFeedbackRequest) (*feedbacksvcpb.SvcCreateFeedbackResponse, error) {
	uid, err := uuid.Parse(r.UserId)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't parse user id")
		return nil, err
	}

	cid, err := uuid.Parse(r.CategoryId)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't parse category id")
		return nil, err
	}

	_, err = s.store.CreateFeedback(ctx, uid, cid, r.Title, r.Body, r.StudentId, r.StudentName, r.StudentEmail, r.StudentPhone, r.StudentMajor, r.StudentJoinSemester, r.StudentCurrentSemester, r.StudentGender, r.StudentRemainingHours, r.StudentTakenHours, r.StudentTotalHours)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't create feedback")
		return nil, err
	}

	return &feedbacksvcpb.SvcCreateFeedbackResponse{}, nil
}

func (s *service) SvcGetFeedbackById(ctx context.Context, r *feedbacksvcpb.SvcGetFeedbackByIdRequest) (*feedbacksvcpb.SvcGetFeedbackByIdResponse, error) {
	id, err := uuid.Parse(r.Id)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't parse feedback id")
		return nil, err
	}

	feedback, err := s.store.GetFeedbackById(ctx, id)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback by id")
		return nil, err
	}

	feedbackHistoryWithStatuses, err := s.store.ListFeedbackStatusHistoryByFeedbackId(ctx, feedback.ID)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback status history by feedback id")
		return nil, err
	}

	svcFeedback := mapStoreFeedbackToSvcFeedback(feedback, feedbackHistoryWithStatuses)

	feedbackCategories, err := s.store.ListFeedbackCategory(ctx)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback categories")
		return nil, err
	}

	feedbackCategoriesMap := make(map[uuid.UUID]*feedbacksvcpb.SvcFeedbackCategory, len(feedbackCategories))
	for i := range feedbackCategories {
		feedbackCategoriesMap[feedbackCategories[i].ID] = mapStoreFeedbackCategoryToSvcFeedbackCategory(feedbackCategories[i])
	}

	svcFeedback.Category = feedbackCategoriesMap[feedback.CategoryID]

	return &feedbacksvcpb.SvcGetFeedbackByIdResponse{
		FeedbackItem: svcFeedback,
	}, nil
}

func (s *service) SvcGetFeedbackByUserId(ctx context.Context, r *feedbacksvcpb.SvcGetFeedbackByUserIdRequest) (*feedbacksvcpb.SvcGetFeedbackByUserIdResponse, error) {
	uid, err := uuid.Parse(r.UserId)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't parse user id")
		return nil, err
	}

	fs, err := s.store.ListFeedbackByUserId(ctx, uid)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback by user id")
		return nil, err
	}

	fisp := make([]*feedbacksvcpb.SvcFeedbackItem, len(fs))
	for i := range fs {
		feedbackHistoryWithStatuses, err := s.store.ListFeedbackStatusHistoryByFeedbackId(ctx, fs[i].ID)
		if err != nil {
			log.Ctx(ctx).Err(err).Msg("couldn't get feedback status history by feedback id")
			return nil, err
		}

		fisp[i] = mapStoreFeedbackToSvcFeedback(fs[i], feedbackHistoryWithStatuses)
	}

	fcs, err := s.store.ListFeedbackCategory(ctx)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback categories")
		return nil, err
	}

	fcsp := make(map[uuid.UUID]*feedbacksvcpb.SvcFeedbackCategory, len(fcs))
	for i := range fcs {
		fcsp[fcs[i].ID] = mapStoreFeedbackCategoryToSvcFeedbackCategory(fcs[i])
	}

	for i := range fisp {
		fisp[i].Category = fcsp[fs[i].CategoryID]
	}

	return &feedbacksvcpb.SvcGetFeedbackByUserIdResponse{
		FeedbackItems: fisp,
	}, nil
}

func (s *service) SvcGetFeedbackCategories(ctx context.Context, r *feedbacksvcpb.SvcGetFeedbackCategoriesRequest) (*feedbacksvcpb.SvcGetFeedbackCategoriesResponse, error) {
	fcs, err := s.store.ListFeedbackCategory(ctx)
	if err != nil {
		log.Ctx(ctx).Err(err).Msg("couldn't get feedback categories")
		return nil, err
	}

	fcsp := make([]*feedbacksvcpb.SvcFeedbackCategory, len(fcs))
	for i := range fcs {
		fcsp[i] = mapStoreFeedbackCategoryToSvcFeedbackCategory(fcs[i])
	}

	return &feedbacksvcpb.SvcGetFeedbackCategoriesResponse{
		Categories: fcsp,
	}, nil
}

func NewServer(store store.Store) feedbacksvcpb.FeedbackSvcServer {
	return &service{
		store: store,
	}
}
