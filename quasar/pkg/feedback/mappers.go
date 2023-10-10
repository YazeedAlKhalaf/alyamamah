package feedbacksvc

import (
	feedbacksvcpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/store/sqlc"
)

// mapStoreFeedbackToSvcFeedback maps a feedback from the store to a feedback for the service, but the category
// has only its ID filled, you need to fill the rest.
func mapStoreFeedbackToSvcFeedback(f *sqlc.Feedback) *feedbacksvcpb.SvcFeedbackItem {
	return &feedbacksvcpb.SvcFeedbackItem{
		Id:    f.ID.String(),
		Title: f.Title,
		Body:  f.Body,
		Category: &feedbacksvcpb.SvcFeedbackCategory{
			Id:     f.CategoryID.String(),
			NameAr: "",
			NameEn: "",
		},
		UserId: f.UserID.String(),
	}
}

func mapStoreFeedbackCategoryToSvcFeedbackCategory(fc *sqlc.FeedbackCategory) *feedbacksvcpb.SvcFeedbackCategory {
	return &feedbacksvcpb.SvcFeedbackCategory{
		Id:     fc.ID.String(),
		NameAr: fc.NameAr,
		NameEn: fc.NameEn,
	}
}
