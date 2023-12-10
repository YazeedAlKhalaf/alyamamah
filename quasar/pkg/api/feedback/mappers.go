package feedback

import (
	feedbackpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/api/feedback/proto"
	feedbacksvcpb "github.com/YazeedAlKhalaf/alyamamah/quasar/pkg/feedback/proto"
)

func mapSvcFeedbackCategoryToPbFeedbackCategory(fc *feedbacksvcpb.SvcFeedbackCategory) *feedbackpb.FeedbackCategory {
	return &feedbackpb.FeedbackCategory{
		Id:     fc.Id,
		NameAr: fc.NameAr,
		NameEn: fc.NameEn,
	}
}

func mapSvcFeedbackItemToPbFeedbackItem(fi *feedbacksvcpb.SvcFeedbackItem) *feedbackpb.FeedbackItem {
	return &feedbackpb.FeedbackItem{
		Id:        fi.Id,
		Title:     fi.Title,
		Body:      fi.Body,
		Category:  mapSvcFeedbackCategoryToPbFeedbackCategory(fi.Category),
		CreatedAt: fi.CreatedAt,
	}
}