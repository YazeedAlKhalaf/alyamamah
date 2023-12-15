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

func mapSvcFeedbackStatusToPbFeedbackStatus(fs *feedbacksvcpb.SvcFeedbackStatus) *feedbackpb.FeedbackStatus {
	return &feedbackpb.FeedbackStatus{
		Id:        fs.Id,
		NameAr:    fs.NameAr,
		NameEn:    fs.NameEn,
		CreatedAt: fs.CreatedAt,
	}
}

func mapSvcFeedbackStatusesToPbFeedbackStatuses(fss []*feedbacksvcpb.SvcFeedbackStatus) []*feedbackpb.FeedbackStatus {
	fs := make([]*feedbackpb.FeedbackStatus, len(fss))
	for i := range fss {
		fs[i] = mapSvcFeedbackStatusToPbFeedbackStatus(fss[i])
	}
	return fs
}

func mapSvcFeedbackItemToPbFeedbackItem(fi *feedbacksvcpb.SvcFeedbackItem) *feedbackpb.FeedbackItem {
	return &feedbackpb.FeedbackItem{
		Id:        fi.Id,
		Title:     fi.Title,
		Body:      fi.Body,
		Category:  mapSvcFeedbackCategoryToPbFeedbackCategory(fi.Category),
		CreatedAt: fi.CreatedAt,
		Statuses:  mapSvcFeedbackStatusesToPbFeedbackStatuses(fi.Statuses),
	}
}
