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

func (*service) CreateFeedback(context.Context, *feedbacksvcpb.CreateFeedbackRequest) (*feedbacksvcpb.CreateFeedbackResponse, error) {
	// TODO: implement me

	return &feedbacksvcpb.CreateFeedbackResponse{}, nil
}

func (*service) GetFeedbackById(context.Context, *feedbacksvcpb.GetFeedbackByIdRequest) (*feedbacksvcpb.GetFeedbackByIdResponse, error) {
	// TODO: implement me

	return &feedbacksvcpb.GetFeedbackByIdResponse{
		FeedbackItem: &feedbacksvcpb.FeedbackItem{
			Id:    "some-feedback-uuid-1",
			Title: "We need a parking solution",
			Body:  "The parking area is too small for the number of students we have.",
			Category: &feedbacksvcpb.FeedbackCategory{
				Id:     "some-feedback-category-uuid-1",
				NameAr: "تجربة الطالب",
				NameEn: "Student Experience",
			},
			UserId: "some-user-uuid",
		},
	}, nil
}

func (*service) GetFeedbackByUserId(context.Context, *feedbacksvcpb.GetFeedbackByUserIdRequest) (*feedbacksvcpb.GetFeedbackByUserIdResponse, error) {
	// TODO: implement me

	return &feedbacksvcpb.GetFeedbackByUserIdResponse{
		FeedbackItems: []*feedbacksvcpb.FeedbackItem{
			{
				Id:    "some-feedback-uuid-1",
				Title: "We need a parking solution",
				Body:  "The parking area is too small for the number of students we have.",
				Category: &feedbacksvcpb.FeedbackCategory{
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
				Category: &feedbacksvcpb.FeedbackCategory{
					Id:     "some-feedback-category-uuid-1",
					NameAr: "تجربة الطالب",
					NameEn: "Student Experience",
				},
				UserId: "some-user-uuid",
			},
		},
	}, nil
}

func (*service) GetFeedbackCategories(context.Context, *feedbacksvcpb.GetFeedbackCategoriesRequest) (*feedbacksvcpb.GetFeedbackCategoriesResponse, error) {
	// TODO: implement me

	return &feedbacksvcpb.GetFeedbackCategoriesResponse{
		Categories: []*feedbacksvcpb.FeedbackCategory{
			{
				Id:     "some-feedback-category-uuid-1",
				NameAr: "تجربة الطالب",
				NameEn: "Student Experience",
			},
			{
				Id:     "some-feedback-category-uuid-2",
				NameAr: "القضايا الأكاديمية",
				NameEn: "Academic Concerns",
			},
			{
				Id:     "some-feedback-category-uuid-3",
				NameAr: "المرافق والبنية التحتية",
				NameEn: "Facilities and Infrastructure",
			},
			{
				Id:     "some-feedback-category-uuid-4",
				NameAr: "Extracurricular Activities",
				NameEn: "الأنشطة اللاصفية",
			},
			{
				Id:     "some-feedback-category-uuid-5",
				NameAr: "أخرى",
				NameEn: "Other",
			},
		},
	}, nil
}

func NewServer(store store.Store) feedbacksvcpb.FeedbackSvcServer {
	return &service{
		store: store,
	}
}
