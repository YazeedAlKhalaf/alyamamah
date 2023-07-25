import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/connecty_cube/connecty_cube_service.dart';
import 'package:alyamamah/core/services/connecty_cube/connecty_cube_service_exception.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:alyamamah/ui/views/chats/chats_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final chatsViewModelProvider =
    StateNotifierProvider<ChatsViewModel, ChatsViewState>(
  (ref) => ChatsViewModel(
    connectyCubeService: ref.read(connectyCubeServiceProvider),
    apiService: ref.read(apiServiceProvider),
    actorDetails: ref.watch(actorDetailsProvider.notifier),
    yuApiService: ref.read(yuApiServiceProvider),
  ),
);

class ChatsViewModel extends StateNotifier<ChatsViewState> {
  final _log = Logger('ChatsViewModel');

  final ConnectyCubeService _connectyCubeService;
  final ApiService _apiService;
  final ActorDetailsNotifier _actorDetails;
  final YuApiService _yuApiService;

  ChatsViewModel({
    required ConnectyCubeService connectyCubeService,
    required ApiService apiService,
    required ActorDetailsNotifier actorDetails,
    required YuApiService yuApiService,
  })  : _connectyCubeService = connectyCubeService,
        _apiService = apiService,
        _actorDetails = actorDetails,
        _yuApiService = yuApiService,
        super(const ChatsViewState());

  String get _currentSemester =>
      _actorDetails.actorDetails?.semester.currentSemester ?? '';

  Future<void> getChats() async {
    try {
      state = state.copyWith(status: ChatsViewStatus.loading);

      final schedule = await _apiService.getStudentSchedule(
        schedule: _currentSemester,
      );

      if (schedule.isNotEmpty) {
        state = state.copyWith(status: ChatsViewStatus.syncingChats);
        final scheduleSections = schedule.map((e) => e.section).toList();
        await _yuApiService.syncChats(
          semester: _currentSemester,
          sections: scheduleSections,
        );
      }
      state = state.copyWith(status: ChatsViewStatus.loading);

      final pagedResult = await _connectyCubeService.getChats();

      state = state.copyWith(
        status: ChatsViewStatus.loaded,
        chats: pagedResult == null ? [] : pagedResult.items,
      );
    } on ConnectyCubeServiceException catch (e) {
      _log.severe('getChats | failed to get chats: $e');

      state = state.copyWith(status: ChatsViewStatus.errorLoading);
    } on YuApiServiceException catch (e) {
      _log.severe('getChats | failed to sync chats: $e');

      state = state.copyWith(status: ChatsViewStatus.errorLoading);
    } on ApiServiceException catch (e) {
      _log.severe('getChats | failed to get schedule: $e');

      state = state.copyWith(status: ChatsViewStatus.errorLoading);
    } catch (e) {
      _log.severe('getChats | unexpected exception: $e');

      state = state.copyWith(status: ChatsViewStatus.errorLoading);
    }
  }
}
