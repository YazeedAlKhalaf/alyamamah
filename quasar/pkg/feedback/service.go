package feedbacksvc

import (
	"context"

	feedbacksvcpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/store"
)

type service struct {
	feedbacksvcpb.UnimplementedFeedbackSvcServer

	store store.Store
}

func (*service) SvcCreateFeedback(ctx context.Context, r *feedbacksvcpb.SvcCreateFeedbackRequest) (*feedbacksvcpb.SvcCreateFeedbackResponse, error) {
	// TODO: implement me

	return &feedbacksvcpb.SvcCreateFeedbackResponse{}, nil
}

func (s *service) SvcGetFeedbackById(ctx context.Context, r *feedbacksvcpb.SvcGetFeedbackByIdRequest) (*feedbacksvcpb.SvcGetFeedbackByIdResponse, error) {
	// TODO: implement me

	return &feedbacksvcpb.SvcGetFeedbackByIdResponse{
		FeedbackItem: &feedbacksvcpb.SvcFeedbackItem{
			Id:    "some-feedback-uuid-1",
			Title: "We need a parking solution",
			Body:  "The parking area is too small for the number of students we have.",
			Category: &feedbacksvcpb.SvcFeedbackCategory{
				Id:     "some-feedback-category-uuid-1",
				NameAr: "تجربة الطالب",
				NameEn: "Student Experience",
			},
			UserId: "some-user-uuid",
		},
	}, nil
}

func (s *service) SvcGetFeedbackByUserId(ctx context.Context, r *feedbacksvcpb.SvcGetFeedbackByUserIdRequest) (*feedbacksvcpb.SvcGetFeedbackByUserIdResponse, error) {
	// TODO: implement me

	return &feedbacksvcpb.SvcGetFeedbackByUserIdResponse{
		FeedbackItems: []*feedbacksvcpb.SvcFeedbackItem{
			{
				Id:    "some-feedback-uuid-1",
				Title: "We need a parking solution",
				Body:  "The parking area is too small for the number of students we have.",
				Category: &feedbacksvcpb.SvcFeedbackCategory{
					Id:     "some-feedback-category-uuid-1",
					NameAr: "تجربة الطالب",
					NameEn: "Student Experience",
				},
				UserId: "some-user-uuid",
			},
			{
				Id:    "some-feedback-uuid-2",
				Title: "We need restaurants on campus",
				Body:  "The food court is too small for the number of students we have.",
				Category: &feedbacksvcpb.SvcFeedbackCategory{
					Id:     "some-feedback-category-uuid-1",
					NameAr: "تجربة الطالب",
					NameEn: "Student Experience",
				},
				UserId: "some-user-uuid",
			},
		},
	}, nil
}

func (s *service) SvcGetFeedbackCategories(ctx context.Context, r *feedbacksvcpb.SvcGetFeedbackCategoriesRequest) (*feedbacksvcpb.SvcGetFeedbackCategoriesResponse, error) {
	fcs, err := s.store.ListFeedbackCategory(ctx)
	if err != nil {
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
