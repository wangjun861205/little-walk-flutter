import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/client.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/main.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/walking_offer.dart';

class WalkingOfferCubit extends QueryCubit<String, WalkingOffer?> {
  final WalkingOfferClient client;
  WalkingOfferCubit({required this.client, WalkingOffer? offer, String? id})
      : super(Query(
          query: (String params) async => client.getWalkingOffer(params),
          params: offer != null ? offer.id! : id!,
          result: offer,
        ));

  Future<void> accept() async {
    emit(state.copyWith(isLoading: true, error: null));
    await client.acceptWalkingOffer(state.result!.id!);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> cancel() async {
    emit(state.copyWith(isLoading: true, error: null));
    await client.cancelWalkingOffer(state.result!.id!);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> create() async {
    emit(state.copyWith(isLoading: true, error: null));
    await client.createWalkingOffer(state.result!);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> finish() async {
    emit(state.copyWith(isLoading: true, error: null));
    await client.finishWalkingOffer(state.result!.id!);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> start() async {
    emit(state.copyWith(isLoading: true, error: null));
    await client.startWalkingOffer(state.result!.id!);
    emit(state.copyWith(isLoading: false));
  }

  bool containsDog(Dog dog) => state.result!.dogs!.contains(dog);

  void addDog(Dog dog) => state.result!.dogs!.add(dog);

  void removeDog(Dog dog) => state.result!.dogs!.removeWhere((d) => d == dog);

  void reportWalkingLocation(Location location) {
    emit(state.copyWith(isLoading: true, error: null));
    client.reportWalkingLocation(WalkingLocation(
        longitude: location.longitude,
        latitude: location.latitude,
        offer: state.result));
    emit(state.copyWith(isLoading: false));
  }
}

class MyWalkingOffersCubit extends QueryCubit<Pagination, List<WalkingOffer>> {
  final WalkingOfferClient client;
  MyWalkingOffersCubit({required this.client, int limit = 20})
      : super(Query(
            query: (params) async => client.myWalkingOffers(params),
            params: Pagination(limit: limit),
            result: [],
            nextParams: (currParams, response) {
              if (response.isEmpty) {
                return currParams;
              }
              return Pagination(
                  limit: currParams.limit, after: response.last.id);
            },
            nextResult: (currResult, response) {
              currResult.addAll(response);
              return currResult;
            }));
}

class NearbyWalkingOffersParams {
  final Location location;
  final Pagination pagination;

  const NearbyWalkingOffersParams(
      {required this.location, required this.pagination});
}

class NearbyWalkingOffersCubit
    extends QueryCubit<NearbyWalkingOffersParams, List<WalkingOffer>> {
  final WalkingOfferClient client;
  NearbyWalkingOffersCubit({required this.client, int limit = 20})
      : super(Query(
            query: (params) async => client.nearbyWalkingOffers(
                location: params.location, pagination: params.pagination),
            params: NearbyWalkingOffersParams(
                location: Location(
                    latitude: CurrentLocation.latitude!,
                    longitude: CurrentLocation.longitude!),
                pagination: Pagination(limit: limit)),
            result: [],
            nextParams: (currParams, response) {
              if (response.isEmpty) {
                return currParams;
              }
              return NearbyWalkingOffersParams(
                location: Location(
                    latitude: CurrentLocation.latitude!,
                    longitude: CurrentLocation.longitude!),
                pagination: Pagination(
                  limit: currParams.pagination.limit,
                  after: response.last.id,
                ),
              );
            },
            nextResult: (currResult, response) {
              currResult.addAll(response);
              return currResult;
            }));
}
