// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SearchModel welcomeFromJson(String str) => SearchModel.fromJson(json.decode(str));

String welcomeToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    int? resultCount;
    List<SearchResultModel>? results;

    SearchModel({
        this.resultCount,
        this.results,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        resultCount: json["resultCount"],
        results: json["results"] == null ? [] : List<SearchResultModel>.from(json["results"]!.map((x) => SearchResultModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class SearchResultModel {
    WrapperType? wrapperType;
    Kind? kind;
    int? artistId;
    int? collectionId;
    int? trackId;
    String? artistName;
    String? collectionName;
    String? trackName;
    String? collectionCensoredName;
    String? trackCensoredName;
    String? artistViewUrl;
    String? collectionViewUrl;
    String? trackViewUrl;
    String? previewUrl;
    String? artworkUrl30;
    String? artworkUrl60;
    String? artworkUrl100;
    double? collectionPrice;
    double? trackPrice;
    DateTime? releaseDate;
    Explicitness? collectionExplicitness;
    Explicitness? trackExplicitness;
    int? discCount;
    int? discNumber;
    int? trackCount;
    int? trackNumber;
    int? trackTimeMillis;
    SearchCountryModel? country;
    Currency? currency;
    String? primaryGenreName;
    bool? isStreamable;
    int? collectionArtistId;
    String? collectionArtistViewUrl;
    double? trackRentalPrice;
    double? collectionHdPrice;
    double? trackHdPrice;
    double? trackHdRentalPrice;
    String? contentAdvisoryRating;
    String? shortDescription;
    String? longDescription;
    bool? hasITunesExtras;
    SearchCollectionArtistNameModel? collectionArtistName;

    SearchResultModel({
        this.wrapperType,
        this.kind,
        this.artistId,
        this.collectionId,
        this.trackId,
        this.artistName,
        this.collectionName,
        this.trackName,
        this.collectionCensoredName,
        this.trackCensoredName,
        this.artistViewUrl,
        this.collectionViewUrl,
        this.trackViewUrl,
        this.previewUrl,
        this.artworkUrl30,
        this.artworkUrl60,
        this.artworkUrl100,
        this.collectionPrice,
        this.trackPrice,
        this.releaseDate,
        this.collectionExplicitness,
        this.trackExplicitness,
        this.discCount,
        this.discNumber,
        this.trackCount,
        this.trackNumber,
        this.trackTimeMillis,
        this.country,
        this.currency,
        this.primaryGenreName,
        this.isStreamable,
        this.collectionArtistId,
        this.collectionArtistViewUrl,
        this.trackRentalPrice,
        this.collectionHdPrice,
        this.trackHdPrice,
        this.trackHdRentalPrice,
        this.contentAdvisoryRating,
        this.shortDescription,
        this.longDescription,
        this.hasITunesExtras,
        this.collectionArtistName,
    });

    factory SearchResultModel.fromJson(Map<String, dynamic> json) => SearchResultModel(
        wrapperType: wrapperTypeValues.map[json["wrapperType"]]!,
        kind: kindValues.map[json["kind"]]!,
        artistId: json["artistId"],
        collectionId: json["collectionId"],
        trackId: json["trackId"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        trackName: json["trackName"],
        collectionCensoredName: json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"],
        trackViewUrl: json["trackViewUrl"],
        previewUrl: json["previewUrl"],
        artworkUrl30: json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"]?.toDouble(),
        trackPrice: json["trackPrice"]?.toDouble(),
        releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
        collectionExplicitness: explicitnessValues.map[json["collectionExplicitness"]]!,
        trackExplicitness: explicitnessValues.map[json["trackExplicitness"]]!,
        discCount: json["discCount"],
        discNumber: json["discNumber"],
        trackCount: json["trackCount"],
        trackNumber: json["trackNumber"],
        trackTimeMillis: json["trackTimeMillis"],
        country: countryValues.map[json["country"]]!,
        currency: currencyValues.map[json["currency"]]!,
        primaryGenreName: json["primaryGenreName"],
        isStreamable: json["isStreamable"],
        collectionArtistId: json["collectionArtistId"],
        collectionArtistViewUrl: json["collectionArtistViewUrl"],
        trackRentalPrice: json["trackRentalPrice"]?.toDouble(),
        collectionHdPrice: json["collectionHdPrice"]?.toDouble(),
        trackHdPrice: json["trackHdPrice"]?.toDouble(),
        trackHdRentalPrice: json["trackHdRentalPrice"]?.toDouble(),
        contentAdvisoryRating: json["contentAdvisoryRating"],
        shortDescription: json["shortDescription"],
        longDescription: json["longDescription"],
        hasITunesExtras: json["hasITunesExtras"],
        collectionArtistName: collectionArtistNameValues.map[json["collectionArtistName"]]!,
    );

    Map<String, dynamic> toJson() => {
        "wrapperType": wrapperTypeValues.reverse[wrapperType],
        "kind": kindValues.reverse[kind],
        "artistId": artistId,
        "collectionId": collectionId,
        "trackId": trackId,
        "artistName": artistName,
        "collectionName": collectionName,
        "trackName": trackName,
        "collectionCensoredName": collectionCensoredName,
        "trackCensoredName": trackCensoredName,
        "artistViewUrl": artistViewUrl,
        "collectionViewUrl": collectionViewUrl,
        "trackViewUrl": trackViewUrl,
        "previewUrl": previewUrl,
        "artworkUrl30": artworkUrl30,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "trackPrice": trackPrice,
        "releaseDate": releaseDate?.toIso8601String(),
        "collectionExplicitness": explicitnessValues.reverse[collectionExplicitness],
        "trackExplicitness": explicitnessValues.reverse[trackExplicitness],
        "discCount": discCount,
        "discNumber": discNumber,
        "trackCount": trackCount,
        "trackNumber": trackNumber,
        "trackTimeMillis": trackTimeMillis,
        "country": countryValues.reverse[country],
        "currency": currencyValues.reverse[currency],
        "primaryGenreName": primaryGenreName,
        "isStreamable": isStreamable,
        "collectionArtistId": collectionArtistId,
        "collectionArtistViewUrl": collectionArtistViewUrl,
        "trackRentalPrice": trackRentalPrice,
        "collectionHdPrice": collectionHdPrice,
        "trackHdPrice": trackHdPrice,
        "trackHdRentalPrice": trackHdRentalPrice,
        "contentAdvisoryRating": contentAdvisoryRating,
        "shortDescription": shortDescription,
        "longDescription": longDescription,
        "hasITunesExtras": hasITunesExtras,
        "collectionArtistName": collectionArtistNameValues.reverse[collectionArtistName],
    };
}

enum SearchCollectionArtistNameModel { TOM_RUSSELL, JACK_JOHNSON, VARIOUS_ARTISTS }

final collectionArtistNameValues = EnumValues({
    "Jack Johnson": SearchCollectionArtistNameModel.JACK_JOHNSON,
    "Tom Russell": SearchCollectionArtistNameModel.TOM_RUSSELL,
    "Various Artists": SearchCollectionArtistNameModel.VARIOUS_ARTISTS
});

enum Explicitness { NOT_EXPLICIT, EXPLICIT }

final explicitnessValues = EnumValues({
    "explicit": Explicitness.EXPLICIT,
    "notExplicit": Explicitness.NOT_EXPLICIT
});

enum SearchCountryModel { USA }

final countryValues = EnumValues({
    "USA": SearchCountryModel.USA
});

enum Currency { USD }

final currencyValues = EnumValues({
    "USD": Currency.USD
});

enum Kind { SONG, FEATURE_MOVIE }

final kindValues = EnumValues({
    "feature-movie": Kind.FEATURE_MOVIE,
    "song": Kind.SONG
});

enum WrapperType { TRACK }

final wrapperTypeValues = EnumValues({
    "track": WrapperType.TRACK
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
