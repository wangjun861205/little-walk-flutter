import 'dart:io';

import 'package:little_walk/models/auth.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/owner.dart';
import 'package:little_walk/models/post.dart';
import 'package:little_walk/models/upload.dart';
import 'package:little_walk/models/walking_offer.dart';
import 'package:little_walk/models/walking_invitation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Auth with _$Auth {
  const factory Auth({
    String? phone,
    String? password,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

class Pagination {
  final int limit;
  final String? after;

  const Pagination({required this.limit, this.after});
}

class Location {
  final double longitude;
  final double latitude;

  const Location({required this.longitude, required this.latitude});
}

abstract class AuthClient {
  Future<void> signup(Auth signup);
  Future<String> login(Auth login);
}

abstract class OwnerClient {
  Future<String> createOwner(Owner owner);
  Future<Owner> updateOwner(Owner owner);
}

abstract class DogClient {
  Future<List<Dog>> myDogs();
  Future<String> addDog(Dog dog);
  Future<String> removeDog(String id);
  // 声明狗狗的所有权， 用于给已存在的狗狗添加主人
  Future<void> declareOwnership(String id);
  Future<List<Breed>> breeds();
  Future<Dog> getDog(String id);
  Future<Dog> updateDog(Dog dog);
}

abstract class WalkingOfferClient {
  Future<String> createWalkingOffer(WalkingOffer offer);
  Future<void> cancelWalkingOffer(String id);
  Future<void> acceptWalkingOffer(String id);
  Future<void> startWalkingOffer(String id);
  Future<void> finishWalkingOffer(String id);
  Future<List<WalkingLocation>> walkingPath(String id);
  Future<String> reportWalkingLocation(WalkingLocation location);
  Future<WalkingOffer> getWalkingOffer(String id);
  Future<List<WalkingOffer>> myWalkingOffers(Pagination pagination);
  Future<List<WalkingOffer>> nearbyWalkingOffers(
      {required Location location, required Pagination pagination});
}

abstract class WalkingInvitationClient {
  Future<String> createWalkingInvitation(CreateWalkingInvitation invitation);
  Future<void> canncelWalkingInvitation(String id);
  Future<void> joinWalkingInvitation(String id);
  Future<void> quitWalkingInvitation(String id);
}

abstract class UploadClient {
  Future<List<UploadedFile>> upload(List<File> file);
}

abstract class PostClient {
  Future<String> createPost(CreatePost post);
  Future<List<Post>> posts(Pagination page);
}
