import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:little_walk/apis/client.dart';
import 'package:dio/dio.dart';
import 'package:little_walk/main.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/owner.dart';
import 'package:little_walk/models/post.dart';
import 'package:little_walk/models/upload.dart';
import 'package:little_walk/models/walking_invitation.dart';
import 'package:little_walk/models/walking_offer.dart';

final errorUnauthorized = Exception("unauthorization");

class HttpClient
    implements
        AuthClient,
        OwnerClient,
        DogClient,
        WalkingOfferClient,
        WalkingInvitationClient,
        UploadClient,
        PostClient {
  late Dio dio;

  HttpClient({required String address, String? authToken}) {
    dio = Dio(BaseOptions(baseUrl: "http://$address", followRedirects: true));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = authToken ?? AuthToken.token;
        if (token != null) {
          options.headers["Authorization"] = token;
        }
        debugPrint(options.headers["Authorization"]);
        handler.next(options);
      },
      onError: (exception, handler) {
        if (exception.response?.statusCode == 401 ||
            exception.response?.statusCode == 403) {
          throw errorUnauthorized;
        }
        handler.next(exception);
      },
    ));
  }

  factory HttpClient.fromEnv() {
    return HttpClient(
        address: Config.backendAddress!, authToken: AuthToken.token);
  }

  @override
  Future<void> signup(Auth auth) async {
    await dio.post("/signup",
        data: signup,
        options: Options(headers: {"Content-Type": "application/json"}));
  }

  @override
  Future<String> login(Auth auth) async {
    final resp = await dio.put<String>("/auth/login",
        data: jsonEncode(auth),
        options: Options(headers: {"Content-Type": "application/json"}));
    return resp.data!;
  }

  @override
  Future<String> addDog(Dog dog) async {
    final resp = await dio.post<String>("/apis/v1/dogs", data: dog);
    return resp.data!;
  }

  @override
  Future<void> declareOwnership(String id) async {
    await dio.post("/dogs/$id/owners");
  }

  @override
  Future<List<Dog>> myDogs() async {
    final resp = await dio.get<List<Dog>>("/dogs/my");
    return resp.data!;
  }

  @override
  Future<String> removeDog(String id) async {
    final resp = await dio.delete<String>("/dogs/$id");
    return resp.data!;
  }

  @override
  Future<List<Breed>> breeds() async {
    final resp = await dio.get<List<Breed>>("/breeds");
    return resp.data!;
  }

  @override
  Future<Dog> getDog(String id) async {
    final resp = await dio.get<Dog>("/dogs/$id");
    return resp.data!;
  }

  @override
  Future<Dog> updateDog(Dog dog) async {
    final resp = await dio.put<Dog>("/dogs");
    return resp.data!;
  }

  @override
  Future<String> createOwner(Owner owner) async {
    final resp = await dio.post<String>("/owners", data: owner);
    return resp.data!;
  }

  @override
  Future<Owner> updateOwner(Owner owner) async {
    final resp = await dio.put<Owner>("/owners", data: owner);
    return resp.data!;
  }

  @override
  Future<String> createWalkingOffer(WalkingOffer offer) async {
    final resp = await dio.post<String>("/walking_offers", data: offer);
    return resp.data!;
  }

  @override
  Future<void> cancelWalkingOffer(String id) async {
    await dio.put("/walking_offers/$id/cancel");
  }

  @override
  Future<void> acceptWalkingOffer(String id) async {
    final resp = await dio.put("/walking_offers/accept");
    return resp.data!;
  }

  @override
  Future<void> startWalkingOffer(String id) async {
    await dio.put("/walking_offers/start");
  }

  @override
  Future<void> finishWalkingOffer(String id) async {
    await dio.put("/walking_offers/finish");
  }

  @override
  Future<List<WalkingLocation>> walkingPath(String id) async {
    final resp = await dio
        .get<List<WalkingLocation>>("/walking_offers/$id/walking_locations");
    return resp.data!;
  }

  @override
  Future<String> reportWalkingLocation(WalkingLocation location) async {
    final resp = await dio.post<String>("/walking_locations");
    return resp.data!;
  }

  @override
  Future<WalkingOffer> getWalkingOffer(String id) async {
    final resp = await dio.get<WalkingOffer>("/walking_offers/$id");
    return resp.data!;
  }

  @override
  Future<List<WalkingOffer>> myWalkingOffers(Pagination pagination) async {
    final resp = await dio.get<List<WalkingOffer>>("/walking_offers/my");
    return resp.data!;
  }

  @override
  Future<List<WalkingOffer>> nearbyWalkingOffers(
      {required Location location, required Pagination pagination}) async {
    final resp = await dio.get<List<WalkingOffer>>(
        "/walking_offers/nearby?longitude=${location.longitude}&latitude=${location.latitude}&limit=${pagination.limit}&after=${pagination.after}");
    return resp.data!;
  }

  @override
  Future<String> createWalkingInvitation(
      CreateWalkingInvitation invitation) async {
    final resp = await dio.post<String>("/walking_invitation");
    return resp.data!;
  }

  @override
  Future<void> canncelWalkingInvitation(String id) async {
    await dio.post<String>("/walking_invitation/$id/cancel");
  }

  @override
  Future<void> joinWalkingInvitation(String id) async {
    await dio.put<String>("/walking_invitation/$id/join");
  }

  @override
  Future<void> quitWalkingInvitation(String id) async {
    await dio.put<String>("/walking_invitation/$id/quit");
  }

  @override
  Future<List<UploadedFile>> upload(List<File> files) async {
    var form = FormData();
    for (final file in files) {
      final filename = file.path.split("/").last;
      form.files.add(MapEntry(filename,
          await MultipartFile.fromFile(file.path, filename: filename)));
    }
    final resp = await dio.post<List<dynamic>>("/apis/v1/uploads", data: form);
    return resp.data!.map((v) => UploadedFile.fromJson(v)).toList();
  }

  @override
  Future<String> createPost(CreatePost post) async {
    final resp = await dio.post<String>("/apis/v1/posts",
        data: jsonEncode({
          "text": post.text,
          "media_ids": post.medias.map((m) => m.id).toList()
        }));
    return resp.data!;
  }

  @override
  Future<List<Post>> posts(Pagination page) async {
    final resp = await dio.get<List<dynamic>>(
        "/apis/v1/posts?limit=${page.limit}&after=${page.after ?? ''}");
    return resp.data!.map((e) => Post.fromJson(e)).toList();
  }
}
