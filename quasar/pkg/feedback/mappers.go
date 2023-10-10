package feedbacksvc

import (
	feedbacksvcpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/store/sqlc"
)

func mapStoreFeedbackCategoryToSvcFeedbackCategory(fc *sqlc.FeedbackCategory) *feedbacksvcpb.SvcFeedbackCategory {
	return &feedbacksvcpb.SvcFeedbackCategory{
		Id:     fc.ID.String(),
		NameAr: fc.NameAr,
		NameEn: fc.NameEn,
	}
}
