import 'package:meta/meta.dart' show required;

import '../models/community.dart';
import 'main.dart';

extension CommunityEndpoint on V1 {
  /// GET /community
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#get-community
  Future<FullCommunityView> getCommunity({
    int id,
    String name,
    String auth,
  }) async {
    assert((id != null) ^ (name != null),
        'Either id or name should be passed, not both nor none or none');

    var res = await get('/community', {
      if (id != null) 'id': id.toString(),
      if (name != null) 'name': name,
      if (auth != null) 'auth': auth,
    });

    return FullCommunityView.fromJson(res);
  }

  /// GET /community/list
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#list-communities
  Future<List<CommunityView>> listCommunities({
    @required SortType sort,
    int page,
    int limit,
    String auth,
  }) async {
    assert(sort != null);

    var res = await get('/community/list', {
      'sort': sort.value,
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
      if (auth != null) 'auth': auth,
    });
    List<dynamic> communities = res['communities'];
    return communities.map((e) => CommunityView.fromJson(e)).toList();
  }

  /// POST /community/follow
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#follow-community
  Future<CommunityView> followCommunity({
    @required int communityId,
    @required bool follow,
    @required String auth,
  }) async {
    assert(communityId != null);
    assert(follow != null);
    assert(auth != null);

    var res = await post('/community/follow', {
      'community_id': communityId,
      'follow': follow,
      'auth': auth,
    });

    return CommunityView.fromJson(res['community']);
  }

  /// GET /user/followed_communities
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#get-followed-communities
  Future<List<CommunityFollowerView>> getFollowedCommunities({
    @required String auth,
  }) async {
    assert(auth != null);

    final res = await get('/user/followed_communities', {
      'auth': auth,
    });
    final List<dynamic> communities = res['communities'];

    return communities.map((e) => CommunityFollowerView.fromJson(e)).toList();
  }
}
