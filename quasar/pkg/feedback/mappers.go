package feedbacksvc

import (
	feedbacksvcpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/proto"
	"github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/store/sqlc"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func mapStoreListFeedbackStatusHistoryByFeedbackIdRowToSvcFeedbackStatus(fsh *sqlc.ListFeedbackStatusHistoryByFeedbackIdRow) *feedbacksvcpb.SvcFeedbackStatus {
	return &feedbacksvcpb.SvcFeedbackStatus{
		Id:        fsh.ID.String(),
		NameAr:    fsh.NameAr,
		NameEn:    fsh.NameEn,
		CreatedAt: timestamppb.New(fsh.CreatedAt),
	}
}

func mapStoreListFeedbackStatusHistoryByFeedbackIdRowsToSvcFeedbackStatuses(feedbackHistoryWithStatus []*sqlc.ListFeedbackStatusHistoryByFeedbackIdRow) []*feedbacksvcpb.SvcFeedbackStatus {
	feedbackHistory := make([]*feedbacksvcpb.SvcFeedbackStatus, len(feedbackHistoryWithStatus))
	for i := range feedbackHistoryWithStatus {
		feedbackHistory[i] = mapStoreListFeedbackStatusHistoryByFeedbackIdRowToSvcFeedbackStatus(feedbackHistoryWithStatus[i])
	}
	return feedbackHistory
}

// mapStoreFeedbackToSvcFeedback maps a feedback from the store to a feedback for the service, but the category
// has only its ID filled, you need to fill the rest.
func mapStoreFeedbackToSvcFeedback(f *sqlc.Feedback, feedbackHistoryWithStatuses []*sqlc.ListFeedbackStatusHistoryByFeedbackIdRow) *feedbacksvcpb.SvcFeedbackItem {

	return &feedbacksvcpb.SvcFeedbackItem{
		Id:    f.ID.String(),
		Title: f.Title,
		Body:  f.Body,
		Category: &feedbacksvcpb.SvcFeedbackCategory{
			Id:     f.CategoryID.String(),
			NameAr: "",
			NameEn: "",
		},
		UserId:    f.UserID.String(),
		CreatedAt: timestamppb.New(f.CreatedAt),
		Statuses:  mapStoreListFeedbackStatusHistoryByFeedbackIdRowsToSvcFeedbackStatuses(feedbackHistoryWithStatuses),
	}
}

func mapStoreFeedbackCategoryToSvcFeedbackCategory(fc *sqlc.FeedbackCategory) *feedbacksvcpb.SvcFeedbackCategory {
	return &feedbacksvcpb.SvcFeedbackCategory{
		Id:     fc.ID.String(),
		NameAr: fc.NameAr,
		NameEn: fc.NameEn,
	}
}
