import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.code,
    required this.product,
    required this.status,
    required this.statusVerbose,
  });

  String code;
  ProductClass product;
  int status;
  String statusVerbose;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        code: json["code"],
        product: ProductClass.fromJson(json["product"]),
        status: json["status"],
        statusVerbose: json["status_verbose"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "product": product.toJson(),
        "status": status,
        "status_verbose": statusVerbose,
      };
}

class ProductClass {
  ProductClass({
    required this.id,
    required this.keywords,
    required this.addedCountriesTags,
    required this.additivesDebugTags,
    required this.additivesN,
    required this.additivesOldN,
    required this.additivesOldTags,
    required this.additivesOriginalTags,
    required this.additivesPrevOriginalTags,
    required this.additivesTags,
    required this.allergens,
    required this.allergensFromIngredients,
    required this.allergensFromUser,
    required this.allergensHierarchy,
    required this.allergensTags,
    required this.aminoAcidsPrevTags,
    required this.aminoAcidsTags,
    required this.brandOwner,
    required this.brandOwnerImported,
    required this.brands,
    required this.brandsDebugTags,
    required this.brandsTags,
    required this.categories,
    required this.categoriesHierarchy,
    required this.categoriesImported,
    required this.categoriesLc,
    required this.categoriesOld,
    required this.categoriesProperties,
    required this.categoriesPropertiesTags,
    required this.categoriesTags,
    required this.categoryProperties,
    required this.checkers,
    required this.checkersTags,
    required this.ciqualFoodNameTags,
    required this.citiesTags,
    required this.code,
    required this.codesTags,
    required this.comparedToCategory,
    required this.complete,
    required this.completeness,
    required this.correctors,
    required this.correctorsTags,
    required this.countries,
    required this.countriesDebugTags,
    required this.countriesHierarchy,
    required this.countriesImported,
    required this.countriesLc,
    required this.countriesTags,
    required this.createdT,
    required this.creator,
    required this.dataQualityBugsTags,
    required this.dataQualityErrorsTags,
    required this.dataQualityInfoTags,
    required this.dataQualityTags,
    required this.dataQualityWarningsTags,
    required this.dataSources,
    required this.dataSourcesImported,
    required this.dataSourcesTags,
    required this.debugParamSortedLangs,
    required this.ecoscoreData,
    required this.ecoscoreGrade,
    required this.ecoscoreTags,
    required this.editors,
    required this.editorsTags,
    required this.embCodes,
    required this.embCodes20141016,
    required this.embCodesDebugTags,
    required this.embCodesOrig,
    required this.embCodesTags,
    required this.entryDatesTags,
    required this.expirationDate,
    required this.expirationDateDebugTags,
    required this.foodGroups,
    required this.foodGroupsTags,
    required this.fruitsVegetablesNuts100GEstimate,
    required this.genericName,
    required this.genericNameEn,
    required this.genericNameEnDebugTags,
    required this.productId,
    required this.imageFrontSmallUrl,
    required this.imageFrontThumbUrl,
    required this.imageFrontUrl,
    required this.imageIngredientsSmallUrl,
    required this.imageIngredientsThumbUrl,
    required this.imageIngredientsUrl,
    required this.imageNutritionSmallUrl,
    required this.imageNutritionThumbUrl,
    required this.imageNutritionUrl,
    required this.imageSmallUrl,
    required this.imageThumbUrl,
    required this.imageUrl,
    required this.images,
    required this.informers,
    required this.informersTags,
    required this.ingredients,
    required this.ingredientsAnalysis,
    required this.ingredientsAnalysisTags,
    required this.ingredientsDebug,
    required this.ingredientsFromOrThatMayBeFromPalmOilN,
    required this.ingredientsFromPalmOilN,
    required this.ingredientsFromPalmOilTags,
    required this.ingredientsHierarchy,
    required this.ingredientsIdsDebug,
    required this.ingredientsN,
    required this.ingredientsNTags,
    required this.ingredientsOriginalTags,
    required this.ingredientsPercentAnalysis,
    required this.ingredientsTags,
    required this.ingredientsText,
    required this.ingredientsTextDebug,
    required this.ingredientsTextEn,
    required this.ingredientsTextEnDebugTags,
    required this.ingredientsTextEnImported,
    required this.ingredientsTextWithAllergens,
    required this.ingredientsTextWithAllergensEn,
    required this.ingredientsThatMayBeFromPalmOilN,
    required this.ingredientsThatMayBeFromPalmOilTags,
    required this.ingredientsWithSpecifiedPercentN,
    required this.ingredientsWithSpecifiedPercentSum,
    required this.ingredientsWithUnspecifiedPercentN,
    required this.ingredientsWithUnspecifiedPercentSum,
    required this.interfaceVersionCreated,
    required this.interfaceVersionModified,
    required this.knownIngredientsN,
    required this.labels,
    required this.labelsHierarchy,
    required this.labelsLc,
    required this.labelsOld,
    required this.labelsTags,
    required this.lang,
    required this.langDebugTags,
    required this.languages,
    required this.languagesHierarchy,
    required this.languagesTags,
    required this.lastEditDatesTags,
    required this.lastEditor,
    required this.lastImageDatesTags,
    required this.lastImageT,
    required this.lastModifiedBy,
    required this.lastModifiedT,
    required this.lc,
    required this.lcImported,
    required this.link,
    required this.linkDebugTags,
    required this.mainCountriesTags,
    required this.manufacturingPlaces,
    required this.manufacturingPlacesDebugTags,
    required this.manufacturingPlacesTags,
    required this.maxImgid,
    required this.mineralsPrevTags,
    required this.mineralsTags,
    required this.miscTags,
    required this.newAdditivesN,
    required this.noNutritionData,
    required this.novaGroup,
    required this.novaGroupDebug,
    required this.novaGroups,
    required this.novaGroupsMarkers,
    required this.novaGroupsTags,
    required this.nucleotidesPrevTags,
    required this.nucleotidesTags,
    required this.nutrientLevels,
    required this.nutrientLevelsTags,
    required this.nutriments,
    required this.nutriscoreData,
    required this.nutriscoreGrade,
    required this.nutriscoreScore,
    required this.nutriscoreScoreOpposite,
    required this.nutritionData,
    required this.nutritionDataPer,
    required this.nutritionDataPerDebugTags,
    required this.nutritionDataPerImported,
    required this.nutritionDataPrepared,
    required this.nutritionDataPreparedPer,
    required this.nutritionDataPreparedPerDebugTags,
    required this.nutritionDataPreparedPerImported,
    required this.nutritionGradeFr,
    required this.nutritionGrades,
    required this.nutritionGradesTags,
    required this.nutritionScoreBeverage,
    required this.nutritionScoreDebug,
    required this.nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients,
    required this.nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue,
    required this.origins,
    required this.originsHierarchy,
    required this.originsLc,
    required this.originsOld,
    required this.originsTags,
    required this.otherNutritionalSubstancesTags,
    required this.packaging,
    required this.packagingHierarchy,
    required this.packagingLc,
    required this.packagingOld,
    required this.packagingOldBeforeTaxonomization,
    required this.packagingTags,
    required this.packagings,
    required this.photographers,
    required this.photographersTags,
    required this.pnnsGroups1,
    required this.pnnsGroups1Tags,
    required this.pnnsGroups2,
    required this.pnnsGroups2Tags,
    required this.popularityKey,
    required this.popularityTags,
    required this.productName,
    required this.productNameEn,
    required this.productNameEnDebugTags,
    required this.productNameEnImported,
    required this.productQuantity,
    required this.purchasePlaces,
    required this.purchasePlacesDebugTags,
    required this.purchasePlacesTags,
    required this.quantity,
    required this.quantityDebugTags,
    required this.removedCountriesTags,
    required this.rev,
    required this.scansN,
    required this.selectedImages,
    required this.servingQuantity,
    required this.servingSize,
    required this.servingSizeDebugTags,
    required this.servingSizeImported,
    required this.sortkey,
    required this.sources,
    required this.sourcesFields,
    required this.states,
    required this.statesHierarchy,
    required this.statesTags,
    required this.stores,
    required this.storesDebugTags,
    required this.storesTags,
    required this.traces,
    required this.tracesDebugTags,
    required this.tracesFromIngredients,
    required this.tracesFromUser,
    required this.tracesHierarchy,
    required this.tracesTags,
    required this.uniqueScansN,
    required this.unknownIngredientsN,
    required this.unknownNutrientsTags,
    required this.updateKey,
    required this.vitaminsPrevTags,
    required this.vitaminsTags,
  });

  String id;
  List<String> keywords;
  List<dynamic> addedCountriesTags;
  List<dynamic> additivesDebugTags;
  int additivesN;
  int additivesOldN;
  List<String> additivesOldTags;
  List<String> additivesOriginalTags;
  List<String> additivesPrevOriginalTags;
  List<String> additivesTags;
  String allergens;
  String allergensFromIngredients;
  String allergensFromUser;
  List<String> allergensHierarchy;
  List<String> allergensTags;
  List<dynamic> aminoAcidsPrevTags;
  List<dynamic> aminoAcidsTags;
  String brandOwner;
  String brandOwnerImported;
  String brands;
  List<dynamic> brandsDebugTags;
  List<String> brandsTags;
  String categories;
  List<String> categoriesHierarchy;
  String categoriesImported;
  String categoriesLc;
  String categoriesOld;
  CategoriesProperties categoriesProperties;
  List<String> categoriesPropertiesTags;
  List<String> categoriesTags;
  CategoriesProperties categoryProperties;
  List<dynamic> checkers;
  List<dynamic> checkersTags;
  List<String> ciqualFoodNameTags;
  List<dynamic> citiesTags;
  String code;
  List<String> codesTags;
  String comparedToCategory;
  int complete;
  double completeness;
  List<String> correctors;
  List<String> correctorsTags;
  String countries;
  List<dynamic> countriesDebugTags;
  List<String> countriesHierarchy;
  String countriesImported;
  String countriesLc;
  List<String> countriesTags;
  int createdT;
  String creator;
  List<dynamic> dataQualityBugsTags;
  List<dynamic> dataQualityErrorsTags;
  List<String> dataQualityInfoTags;
  List<String> dataQualityTags;
  List<String> dataQualityWarningsTags;
  String dataSources;
  String dataSourcesImported;
  List<String> dataSourcesTags;
  List<String> debugParamSortedLangs;
  EcoscoreData ecoscoreData;
  String ecoscoreGrade;
  List<String> ecoscoreTags;
  List<String> editors;
  List<String> editorsTags;
  String embCodes;
  String embCodes20141016;
  List<dynamic> embCodesDebugTags;
  String embCodesOrig;
  List<dynamic> embCodesTags;
  List<String> entryDatesTags;
  String expirationDate;
  List<dynamic> expirationDateDebugTags;
  String foodGroups;
  List<String> foodGroupsTags;
  int fruitsVegetablesNuts100GEstimate;
  String genericName;
  String genericNameEn;
  List<dynamic> genericNameEnDebugTags;
  String productId;
  String imageFrontSmallUrl;
  String imageFrontThumbUrl;
  String imageFrontUrl;
  String imageIngredientsSmallUrl;
  String imageIngredientsThumbUrl;
  String imageIngredientsUrl;
  String imageNutritionSmallUrl;
  String imageNutritionThumbUrl;
  String imageNutritionUrl;
  String imageSmallUrl;
  String imageThumbUrl;
  String imageUrl;
  Images images;
  List<String> informers;
  List<String> informersTags;
  List<Ingredient> ingredients;
  IngredientsAnalysis ingredientsAnalysis;
  List<String> ingredientsAnalysisTags;
  List<String> ingredientsDebug;
  int ingredientsFromOrThatMayBeFromPalmOilN;
  int ingredientsFromPalmOilN;
  List<dynamic> ingredientsFromPalmOilTags;
  List<String> ingredientsHierarchy;
  List<String> ingredientsIdsDebug;
  int ingredientsN;
  List<String> ingredientsNTags;
  List<String> ingredientsOriginalTags;
  int ingredientsPercentAnalysis;
  List<String> ingredientsTags;
  String ingredientsText;
  String ingredientsTextDebug;
  String ingredientsTextEn;
  List<dynamic> ingredientsTextEnDebugTags;
  String ingredientsTextEnImported;
  String ingredientsTextWithAllergens;
  String ingredientsTextWithAllergensEn;
  int ingredientsThatMayBeFromPalmOilN;
  List<dynamic> ingredientsThatMayBeFromPalmOilTags;
  int ingredientsWithSpecifiedPercentN;
  int ingredientsWithSpecifiedPercentSum;
  int ingredientsWithUnspecifiedPercentN;
  int ingredientsWithUnspecifiedPercentSum;
  String interfaceVersionCreated;
  String interfaceVersionModified;
  int knownIngredientsN;
  String labels;
  List<String> labelsHierarchy;
  String labelsLc;
  String labelsOld;
  List<String> labelsTags;
  String lang;
  List<dynamic> langDebugTags;
  Languages languages;

  List<String> languagesHierarchy;
  List<String> languagesTags;
  List<String> lastEditDatesTags;
  String lastEditor;
  List<String> lastImageDatesTags;
  int lastImageT;
  String lastModifiedBy;
  int lastModifiedT;
  String lc;
  String lcImported;
  String link;
  List<dynamic> linkDebugTags;
  List<dynamic> mainCountriesTags;
  String manufacturingPlaces;
  List<dynamic> manufacturingPlacesDebugTags;
  List<dynamic> manufacturingPlacesTags;
  String maxImgid;
  List<dynamic> mineralsPrevTags;
  List<dynamic> mineralsTags;
  List<String> miscTags;
  int newAdditivesN;
  String noNutritionData;
  int novaGroup;
  String novaGroupDebug;
  String novaGroups;
  Map<String, List<List<String>>> novaGroupsMarkers;
  List<String> novaGroupsTags;
  List<dynamic> nucleotidesPrevTags;
  List<dynamic> nucleotidesTags;
  NutrientLevels nutrientLevels;
  List<String> nutrientLevelsTags;
  Nutriments nutriments;
  NutriscoreData nutriscoreData;
  String nutriscoreGrade;
  int nutriscoreScore;
  int nutriscoreScoreOpposite;
  String nutritionData;
  String nutritionDataPer;
  List<dynamic> nutritionDataPerDebugTags;
  String nutritionDataPerImported;
  String nutritionDataPrepared;
  String nutritionDataPreparedPer;
  List<dynamic> nutritionDataPreparedPerDebugTags;
  String nutritionDataPreparedPerImported;
  String nutritionGradeFr;
  String nutritionGrades;
  List<String> nutritionGradesTags;
  int nutritionScoreBeverage;
  String nutritionScoreDebug;
  int nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients;
  int nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue;
  String origins;
  List<String> originsHierarchy;
  String originsLc;
  String originsOld;
  List<String> originsTags;
  List<dynamic> otherNutritionalSubstancesTags;
  String packaging;
  List<String> packagingHierarchy;
  String packagingLc;
  String packagingOld;
  String packagingOldBeforeTaxonomization;
  List<String> packagingTags;
  List<ProductPackaging> packagings;
  List<String> photographers;
  List<String> photographersTags;
  String pnnsGroups1;
  List<String> pnnsGroups1Tags;
  String pnnsGroups2;
  List<String> pnnsGroups2Tags;
  int popularityKey;
  List<String> popularityTags;
  String productName;
  String productNameEn;
  List<dynamic> productNameEnDebugTags;
  String productNameEnImported;
  String productQuantity;
  String purchasePlaces;
  List<dynamic> purchasePlacesDebugTags;
  List<dynamic> purchasePlacesTags;
  String quantity;
  List<dynamic> quantityDebugTags;
  List<dynamic> removedCountriesTags;
  int rev;
  int scansN;
  SelectedImages selectedImages;
  String servingQuantity;
  String servingSize;
  List<dynamic> servingSizeDebugTags;
  String servingSizeImported;
  int sortkey;
  List<Source> sources;
  SourcesFields sourcesFields;
  String states;
  List<String> statesHierarchy;
  List<String> statesTags;
  String stores;
  List<dynamic> storesDebugTags;
  List<dynamic> storesTags;
  String traces;
  List<dynamic> tracesDebugTags;
  String tracesFromIngredients;
  String tracesFromUser;
  List<String> tracesHierarchy;
  List<String> tracesTags;
  int uniqueScansN;
  int unknownIngredientsN;
  List<dynamic> unknownNutrientsTags;
  String updateKey;
  List<dynamic> vitaminsPrevTags;
  List<dynamic> vitaminsTags;

  factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
        id: json["_id"],
        keywords: List<String>.from(json["_keywords"].map((x) => x)),
        addedCountriesTags:
            List<dynamic>.from(json["added_countries_tags"].map((x) => x)),
        additivesDebugTags:
            List<dynamic>.from(json["additives_debug_tags"].map((x) => x)),
        additivesN: json["additives_n"],
        additivesOldN: json["additives_old_n"],
        additivesOldTags:
            List<String>.from(json["additives_old_tags"].map((x) => x)),
        additivesOriginalTags:
            List<String>.from(json["additives_original_tags"].map((x) => x)),
        additivesPrevOriginalTags: List<String>.from(
            json["additives_prev_original_tags"].map((x) => x)),
        additivesTags: List<String>.from(json["additives_tags"].map((x) => x)),
        allergens: json["allergens"],
        allergensFromIngredients: json["allergens_from_ingredients"],
        allergensFromUser: json["allergens_from_user"],
        allergensHierarchy:
            List<String>.from(json["allergens_hierarchy"].map((x) => x)),
        allergensTags: List<String>.from(json["allergens_tags"].map((x) => x)),
        aminoAcidsPrevTags:
            List<dynamic>.from(json["amino_acids_prev_tags"].map((x) => x)),
        aminoAcidsTags:
            List<dynamic>.from(json["amino_acids_tags"].map((x) => x)),
        brandOwner: json["brand_owner"],
        brandOwnerImported: json["brand_owner_imported"],
        brands: json["brands"],
        brandsDebugTags:
            List<dynamic>.from(json["brands_debug_tags"].map((x) => x)),
        brandsTags: List<String>.from(json["brands_tags"].map((x) => x)),
        categories: json["categories"],
        categoriesHierarchy:
            List<String>.from(json["categories_hierarchy"].map((x) => x)),
        categoriesImported: json["categories_imported"],
        categoriesLc: json["categories_lc"],
        categoriesOld: json["categories_old"],
        categoriesProperties:
            CategoriesProperties.fromJson(json["categories_properties"]),
        categoriesPropertiesTags:
            List<String>.from(json["categories_properties_tags"].map((x) => x)),
        categoriesTags:
            List<String>.from(json["categories_tags"].map((x) => x)),
        categoryProperties:
            CategoriesProperties.fromJson(json["category_properties"]),
        checkers: List<dynamic>.from(json["checkers"].map((x) => x)),
        checkersTags: List<dynamic>.from(json["checkers_tags"].map((x) => x)),
        ciqualFoodNameTags:
            List<String>.from(json["ciqual_food_name_tags"].map((x) => x)),
        citiesTags: List<dynamic>.from(json["cities_tags"].map((x) => x)),
        code: json["code"],
        codesTags: List<String>.from(json["codes_tags"].map((x) => x)),
        comparedToCategory: json["compared_to_category"],
        complete: json["complete"],
        completeness: json["completeness"].toDouble(),
        correctors: List<String>.from(json["correctors"].map((x) => x)),
        correctorsTags:
            List<String>.from(json["correctors_tags"].map((x) => x)),
        countries: json["countries"],
        countriesDebugTags:
            List<dynamic>.from(json["countries_debug_tags"].map((x) => x)),
        countriesHierarchy:
            List<String>.from(json["countries_hierarchy"].map((x) => x)),
        countriesImported: json["countries_imported"],
        countriesLc: json["countries_lc"],
        countriesTags: List<String>.from(json["countries_tags"].map((x) => x)),
        createdT: json["created_t"],
        creator: json["creator"],
        dataQualityBugsTags:
            List<dynamic>.from(json["data_quality_bugs_tags"].map((x) => x)),
        dataQualityErrorsTags:
            List<dynamic>.from(json["data_quality_errors_tags"].map((x) => x)),
        dataQualityInfoTags:
            List<String>.from(json["data_quality_info_tags"].map((x) => x)),
        dataQualityTags:
            List<String>.from(json["data_quality_tags"].map((x) => x)),
        dataQualityWarningsTags:
            List<String>.from(json["data_quality_warnings_tags"].map((x) => x)),
        dataSources: json["data_sources"],
        dataSourcesImported: json["data_sources_imported"],
        dataSourcesTags:
            List<String>.from(json["data_sources_tags"].map((x) => x)),
        debugParamSortedLangs:
            List<String>.from(json["debug_param_sorted_langs"].map((x) => x)),
        ecoscoreData: EcoscoreData.fromJson(json["ecoscore_data"]),
        ecoscoreGrade: json["ecoscore_grade"],
        ecoscoreTags: List<String>.from(json["ecoscore_tags"].map((x) => x)),
        editors: List<String>.from(json["editors"].map((x) => x)),
        editorsTags: List<String>.from(json["editors_tags"].map((x) => x)),
        embCodes: json["emb_codes"],
        embCodes20141016: json["emb_codes_20141016"],
        embCodesDebugTags:
            List<dynamic>.from(json["emb_codes_debug_tags"].map((x) => x)),
        embCodesOrig: json["emb_codes_orig"],
        embCodesTags: List<dynamic>.from(json["emb_codes_tags"].map((x) => x)),
        entryDatesTags:
            List<String>.from(json["entry_dates_tags"].map((x) => x)),
        expirationDate: json["expiration_date"],
        expirationDateDebugTags: List<dynamic>.from(
            json["expiration_date_debug_tags"].map((x) => x)),
        foodGroups: json["food_groups"],
        foodGroupsTags:
            List<String>.from(json["food_groups_tags"].map((x) => x)),
        fruitsVegetablesNuts100GEstimate:
            json["fruits-vegetables-nuts_100g_estimate"],
        genericName: json["generic_name"],
        genericNameEn: json["generic_name_en"],
        genericNameEnDebugTags: List<dynamic>.from(
            json["generic_name_en_debug_tags"].map((x) => x)),
        productId: json["id"],
        imageFrontSmallUrl: json["image_front_small_url"],
        imageFrontThumbUrl: json["image_front_thumb_url"],
        imageFrontUrl: json["image_front_url"],
        imageIngredientsSmallUrl: json["image_ingredients_small_url"],
        imageIngredientsThumbUrl: json["image_ingredients_thumb_url"],
        imageIngredientsUrl: json["image_ingredients_url"],
        imageNutritionSmallUrl: json["image_nutrition_small_url"],
        imageNutritionThumbUrl: json["image_nutrition_thumb_url"],
        imageNutritionUrl: json["image_nutrition_url"],
        imageSmallUrl: json["image_small_url"],
        imageThumbUrl: json["image_thumb_url"],
        imageUrl: json["image_url"],
        images: Images.fromJson(json["images"]),
        informers: List<String>.from(json["informers"].map((x) => x)),
        informersTags: List<String>.from(json["informers_tags"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        ingredientsAnalysis:
            IngredientsAnalysis.fromJson(json["ingredients_analysis"]),
        ingredientsAnalysisTags:
            List<String>.from(json["ingredients_analysis_tags"].map((x) => x)),
        ingredientsDebug:
            List<String>.from(json["ingredients_debug"].map((x) => x)),
        ingredientsFromOrThatMayBeFromPalmOilN:
            json["ingredients_from_or_that_may_be_from_palm_oil_n"],
        ingredientsFromPalmOilN: json["ingredients_from_palm_oil_n"],
        ingredientsFromPalmOilTags: List<dynamic>.from(
            json["ingredients_from_palm_oil_tags"].map((x) => x)),
        ingredientsHierarchy:
            List<String>.from(json["ingredients_hierarchy"].map((x) => x)),
        ingredientsIdsDebug:
            List<String>.from(json["ingredients_ids_debug"].map((x) => x)),
        ingredientsN: json["ingredients_n"],
        ingredientsNTags:
            List<String>.from(json["ingredients_n_tags"].map((x) => x)),
        ingredientsOriginalTags:
            List<String>.from(json["ingredients_original_tags"].map((x) => x)),
        ingredientsPercentAnalysis: json["ingredients_percent_analysis"],
        ingredientsTags:
            List<String>.from(json["ingredients_tags"].map((x) => x)),
        ingredientsText: json["ingredients_text"],
        ingredientsTextDebug: json["ingredients_text_debug"],
        ingredientsTextEn: json["ingredients_text_en"],
        ingredientsTextEnDebugTags: List<dynamic>.from(
            json["ingredients_text_en_debug_tags"].map((x) => x)),
        ingredientsTextEnImported: json["ingredients_text_en_imported"],
        ingredientsTextWithAllergens: json["ingredients_text_with_allergens"],
        ingredientsTextWithAllergensEn:
            json["ingredients_text_with_allergens_en"],
        ingredientsThatMayBeFromPalmOilN:
            json["ingredients_that_may_be_from_palm_oil_n"],
        ingredientsThatMayBeFromPalmOilTags: List<dynamic>.from(
            json["ingredients_that_may_be_from_palm_oil_tags"].map((x) => x)),
        ingredientsWithSpecifiedPercentN:
            json["ingredients_with_specified_percent_n"],
        ingredientsWithSpecifiedPercentSum:
            json["ingredients_with_specified_percent_sum"],
        ingredientsWithUnspecifiedPercentN:
            json["ingredients_with_unspecified_percent_n"],
        ingredientsWithUnspecifiedPercentSum:
            json["ingredients_with_unspecified_percent_sum"],
        interfaceVersionCreated: json["interface_version_created"],
        interfaceVersionModified: json["interface_version_modified"],
        knownIngredientsN: json["known_ingredients_n"],
        labels: json["labels"],
        labelsHierarchy:
            List<String>.from(json["labels_hierarchy"].map((x) => x)),
        labelsLc: json["labels_lc"],
        labelsOld: json["labels_old"],
        labelsTags: List<String>.from(json["labels_tags"].map((x) => x)),
        lang: json["lang"],
        langDebugTags:
            List<dynamic>.from(json["lang_debug_tags"].map((x) => x)),
        languages: Languages.fromJson(json["languages"]),
        languagesHierarchy:
            List<String>.from(json["languages_hierarchy"].map((x) => x)),
        languagesTags: List<String>.from(json["languages_tags"].map((x) => x)),
        lastEditDatesTags:
            List<String>.from(json["last_edit_dates_tags"].map((x) => x)),
        lastEditor: json["last_editor"],
        lastImageDatesTags:
            List<String>.from(json["last_image_dates_tags"].map((x) => x)),
        lastImageT: json["last_image_t"],
        lastModifiedBy: json["last_modified_by"],
        lastModifiedT: json["last_modified_t"],
        lc: json["lc"],
        lcImported: json["lc_imported"],
        link: json["link"],
        linkDebugTags:
            List<dynamic>.from(json["link_debug_tags"].map((x) => x)),
        mainCountriesTags:
            List<dynamic>.from(json["main_countries_tags"].map((x) => x)),
        manufacturingPlaces: json["manufacturing_places"],
        manufacturingPlacesDebugTags: List<dynamic>.from(
            json["manufacturing_places_debug_tags"].map((x) => x)),
        manufacturingPlacesTags:
            List<dynamic>.from(json["manufacturing_places_tags"].map((x) => x)),
        maxImgid: json["max_imgid"],
        mineralsPrevTags:
            List<dynamic>.from(json["minerals_prev_tags"].map((x) => x)),
        mineralsTags: List<dynamic>.from(json["minerals_tags"].map((x) => x)),
        miscTags: List<String>.from(json["misc_tags"].map((x) => x)),
        newAdditivesN: json["new_additives_n"],
        noNutritionData: json["no_nutrition_data"],
        novaGroup: json["nova_group"],
        novaGroupDebug: json["nova_group_debug"],
        novaGroups: json["nova_groups"],
        novaGroupsMarkers: Map.from(json["nova_groups_markers"]).map((k, v) =>
            MapEntry<String, List<List<String>>>(
                k,
                List<List<String>>.from(
                    v.map((x) => List<String>.from(x.map((x) => x)))))),
        novaGroupsTags:
            List<String>.from(json["nova_groups_tags"].map((x) => x)),
        nucleotidesPrevTags:
            List<dynamic>.from(json["nucleotides_prev_tags"].map((x) => x)),
        nucleotidesTags:
            List<dynamic>.from(json["nucleotides_tags"].map((x) => x)),
        nutrientLevels: NutrientLevels.fromJson(json["nutrient_levels"]),
        nutrientLevelsTags:
            List<String>.from(json["nutrient_levels_tags"].map((x) => x)),
        nutriments: Nutriments.fromJson(json["nutriments"]),
        nutriscoreData: NutriscoreData.fromJson(json["nutriscore_data"]),
        nutriscoreGrade: json["nutriscore_grade"],
        nutriscoreScore: json["nutriscore_score"],
        nutriscoreScoreOpposite: json["nutriscore_score_opposite"],
        nutritionData: json["nutrition_data"],
        nutritionDataPer: json["nutrition_data_per"],
        nutritionDataPerDebugTags: List<dynamic>.from(
            json["nutrition_data_per_debug_tags"].map((x) => x)),
        nutritionDataPerImported: json["nutrition_data_per_imported"],
        nutritionDataPrepared: json["nutrition_data_prepared"],
        nutritionDataPreparedPer: json["nutrition_data_prepared_per"],
        nutritionDataPreparedPerDebugTags: List<dynamic>.from(
            json["nutrition_data_prepared_per_debug_tags"].map((x) => x)),
        nutritionDataPreparedPerImported:
            json["nutrition_data_prepared_per_imported"],
        nutritionGradeFr: json["nutrition_grade_fr"],
        nutritionGrades: json["nutrition_grades"],
        nutritionGradesTags:
            List<String>.from(json["nutrition_grades_tags"].map((x) => x)),
        nutritionScoreBeverage: json["nutrition_score_beverage"],
        nutritionScoreDebug: json["nutrition_score_debug"],
        nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients: json[
            "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients"],
        nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue: json[
            "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients_value"],
        origins: json["origins"],
        originsHierarchy:
            List<String>.from(json["origins_hierarchy"].map((x) => x)),
        originsLc: json["origins_lc"],
        originsOld: json["origins_old"],
        originsTags: List<String>.from(json["origins_tags"].map((x) => x)),
        otherNutritionalSubstancesTags: List<dynamic>.from(
            json["other_nutritional_substances_tags"].map((x) => x)),
        packaging: json["packaging"],
        packagingHierarchy:
            List<String>.from(json["packaging_hierarchy"].map((x) => x)),
        packagingLc: json["packaging_lc"],
        packagingOld: json["packaging_old"],
        packagingOldBeforeTaxonomization:
            json["packaging_old_before_taxonomization"],
        packagingTags: List<String>.from(json["packaging_tags"].map((x) => x)),
        packagings: List<ProductPackaging>.from(
            json["packagings"].map((x) => ProductPackaging.fromJson(x))),
        photographers: List<String>.from(json["photographers"].map((x) => x)),
        photographersTags:
            List<String>.from(json["photographers_tags"].map((x) => x)),
        pnnsGroups1: json["pnns_groups_1"],
        pnnsGroups1Tags:
            List<String>.from(json["pnns_groups_1_tags"].map((x) => x)),
        pnnsGroups2: json["pnns_groups_2"],
        pnnsGroups2Tags:
            List<String>.from(json["pnns_groups_2_tags"].map((x) => x)),
        popularityKey: json["popularity_key"],
        popularityTags:
            List<String>.from(json["popularity_tags"].map((x) => x)),
        productName: json["product_name"],
        productNameEn: json["product_name_en"],
        productNameEnDebugTags: List<dynamic>.from(
            json["product_name_en_debug_tags"].map((x) => x)),
        productNameEnImported: json["product_name_en_imported"],
        productQuantity: json["product_quantity"],
        purchasePlaces: json["purchase_places"],
        purchasePlacesDebugTags: List<dynamic>.from(
            json["purchase_places_debug_tags"].map((x) => x)),
        purchasePlacesTags:
            List<dynamic>.from(json["purchase_places_tags"].map((x) => x)),
        quantity: json["quantity"],
        quantityDebugTags:
            List<dynamic>.from(json["quantity_debug_tags"].map((x) => x)),
        removedCountriesTags:
            List<dynamic>.from(json["removed_countries_tags"].map((x) => x)),
        rev: json["rev"],
        scansN: json["scans_n"],
        selectedImages: SelectedImages.fromJson(json["selected_images"]),
        servingQuantity: json["serving_quantity"],
        servingSize: json["serving_size"],
        servingSizeDebugTags:
            List<dynamic>.from(json["serving_size_debug_tags"].map((x) => x)),
        servingSizeImported: json["serving_size_imported"],
        sortkey: json["sortkey"],
        sources:
            List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
        sourcesFields: SourcesFields.fromJson(json["sources_fields"]),
        states: json["states"],
        statesHierarchy:
            List<String>.from(json["states_hierarchy"].map((x) => x)),
        statesTags: List<String>.from(json["states_tags"].map((x) => x)),
        stores: json["stores"],
        storesDebugTags:
            List<dynamic>.from(json["stores_debug_tags"].map((x) => x)),
        storesTags: List<dynamic>.from(json["stores_tags"].map((x) => x)),
        traces: json["traces"],
        tracesDebugTags:
            List<dynamic>.from(json["traces_debug_tags"].map((x) => x)),
        tracesFromIngredients: json["traces_from_ingredients"],
        tracesFromUser: json["traces_from_user"],
        tracesHierarchy:
            List<String>.from(json["traces_hierarchy"].map((x) => x)),
        tracesTags: List<String>.from(json["traces_tags"].map((x) => x)),
        uniqueScansN: json["unique_scans_n"],
        unknownIngredientsN: json["unknown_ingredients_n"],
        unknownNutrientsTags:
            List<dynamic>.from(json["unknown_nutrients_tags"].map((x) => x)),
        updateKey: json["update_key"],
        vitaminsPrevTags:
            List<dynamic>.from(json["vitamins_prev_tags"].map((x) => x)),
        vitaminsTags: List<dynamic>.from(json["vitamins_tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_keywords": List<dynamic>.from(keywords.map((x) => x)),
        "added_countries_tags":
            List<dynamic>.from(addedCountriesTags.map((x) => x)),
        "additives_debug_tags":
            List<dynamic>.from(additivesDebugTags.map((x) => x)),
        "additives_n": additivesN,
        "additives_old_n": additivesOldN,
        "additives_old_tags":
            List<dynamic>.from(additivesOldTags.map((x) => x)),
        "additives_original_tags":
            List<dynamic>.from(additivesOriginalTags.map((x) => x)),
        "additives_prev_original_tags":
            List<dynamic>.from(additivesPrevOriginalTags.map((x) => x)),
        "additives_tags": List<dynamic>.from(additivesTags.map((x) => x)),
        "allergens": allergens,
        "allergens_from_ingredients": allergensFromIngredients,
        "allergens_from_user": allergensFromUser,
        "allergens_hierarchy":
            List<dynamic>.from(allergensHierarchy.map((x) => x)),
        "allergens_tags": List<dynamic>.from(allergensTags.map((x) => x)),
        "amino_acids_prev_tags":
            List<dynamic>.from(aminoAcidsPrevTags.map((x) => x)),
        "amino_acids_tags": List<dynamic>.from(aminoAcidsTags.map((x) => x)),
        "brand_owner": brandOwner,
        "brand_owner_imported": brandOwnerImported,
        "brands": brands,
        "brands_debug_tags": List<dynamic>.from(brandsDebugTags.map((x) => x)),
        "brands_tags": List<dynamic>.from(brandsTags.map((x) => x)),
        "categories": categories,
        "categories_hierarchy":
            List<dynamic>.from(categoriesHierarchy.map((x) => x)),
        "categories_imported": categoriesImported,
        "categories_lc": categoriesLc,
        "categories_old": categoriesOld,
        "categories_properties": categoriesProperties.toJson(),
        "categories_properties_tags":
            List<dynamic>.from(categoriesPropertiesTags.map((x) => x)),
        "categories_tags": List<dynamic>.from(categoriesTags.map((x) => x)),
        "category_properties": categoryProperties.toJson(),
        "checkers": List<dynamic>.from(checkers.map((x) => x)),
        "checkers_tags": List<dynamic>.from(checkersTags.map((x) => x)),
        "ciqual_food_name_tags":
            List<dynamic>.from(ciqualFoodNameTags.map((x) => x)),
        "cities_tags": List<dynamic>.from(citiesTags.map((x) => x)),
        "code": code,
        "codes_tags": List<dynamic>.from(codesTags.map((x) => x)),
        "compared_to_category": comparedToCategory,
        "complete": complete,
        "completeness": completeness,
        "correctors": List<dynamic>.from(correctors.map((x) => x)),
        "correctors_tags": List<dynamic>.from(correctorsTags.map((x) => x)),
        "countries": countries,
        "countries_debug_tags":
            List<dynamic>.from(countriesDebugTags.map((x) => x)),
        "countries_hierarchy":
            List<dynamic>.from(countriesHierarchy.map((x) => x)),
        "countries_imported": countriesImported,
        "countries_lc": countriesLc,
        "countries_tags": List<dynamic>.from(countriesTags.map((x) => x)),
        "created_t": createdT,
        "creator": creator,
        "data_quality_bugs_tags":
            List<dynamic>.from(dataQualityBugsTags.map((x) => x)),
        "data_quality_errors_tags":
            List<dynamic>.from(dataQualityErrorsTags.map((x) => x)),
        "data_quality_info_tags":
            List<dynamic>.from(dataQualityInfoTags.map((x) => x)),
        "data_quality_tags": List<dynamic>.from(dataQualityTags.map((x) => x)),
        "data_quality_warnings_tags":
            List<dynamic>.from(dataQualityWarningsTags.map((x) => x)),
        "data_sources": dataSources,
        "data_sources_imported": dataSourcesImported,
        "data_sources_tags": List<dynamic>.from(dataSourcesTags.map((x) => x)),
        "debug_param_sorted_langs":
            List<dynamic>.from(debugParamSortedLangs.map((x) => x)),
        "ecoscore_data": ecoscoreData.toJson(),
        "ecoscore_grade": ecoscoreGrade,
        "ecoscore_tags": List<dynamic>.from(ecoscoreTags.map((x) => x)),
        "editors": List<dynamic>.from(editors.map((x) => x)),
        "editors_tags": List<dynamic>.from(editorsTags.map((x) => x)),
        "emb_codes": embCodes,
        "emb_codes_20141016": embCodes20141016,
        "emb_codes_debug_tags":
            List<dynamic>.from(embCodesDebugTags.map((x) => x)),
        "emb_codes_orig": embCodesOrig,
        "emb_codes_tags": List<dynamic>.from(embCodesTags.map((x) => x)),
        "entry_dates_tags": List<dynamic>.from(entryDatesTags.map((x) => x)),
        "expiration_date": expirationDate,
        "expiration_date_debug_tags":
            List<dynamic>.from(expirationDateDebugTags.map((x) => x)),
        "food_groups": foodGroups,
        "food_groups_tags": List<dynamic>.from(foodGroupsTags.map((x) => x)),
        "fruits-vegetables-nuts_100g_estimate":
            fruitsVegetablesNuts100GEstimate,
        "generic_name": genericName,
        "generic_name_en": genericNameEn,
        "generic_name_en_debug_tags":
            List<dynamic>.from(genericNameEnDebugTags.map((x) => x)),
        "id": productId,
        "image_front_small_url": imageFrontSmallUrl,
        "image_front_thumb_url": imageFrontThumbUrl,
        "image_front_url": imageFrontUrl,
        "image_ingredients_small_url": imageIngredientsSmallUrl,
        "image_ingredients_thumb_url": imageIngredientsThumbUrl,
        "image_ingredients_url": imageIngredientsUrl,
        "image_nutrition_small_url": imageNutritionSmallUrl,
        "image_nutrition_thumb_url": imageNutritionThumbUrl,
        "image_nutrition_url": imageNutritionUrl,
        "image_small_url": imageSmallUrl,
        "image_thumb_url": imageThumbUrl,
        "image_url": imageUrl,
        "images": images.toJson(),
        "informers": List<dynamic>.from(informers.map((x) => x)),
        "informers_tags": List<dynamic>.from(informersTags.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "ingredients_analysis": ingredientsAnalysis.toJson(),
        "ingredients_analysis_tags":
            List<dynamic>.from(ingredientsAnalysisTags.map((x) => x)),
        "ingredients_debug": List<dynamic>.from(ingredientsDebug.map((x) => x)),
        "ingredients_from_or_that_may_be_from_palm_oil_n":
            ingredientsFromOrThatMayBeFromPalmOilN,
        "ingredients_from_palm_oil_n": ingredientsFromPalmOilN,
        "ingredients_from_palm_oil_tags":
            List<dynamic>.from(ingredientsFromPalmOilTags.map((x) => x)),
        "ingredients_hierarchy":
            List<dynamic>.from(ingredientsHierarchy.map((x) => x)),
        "ingredients_ids_debug":
            List<dynamic>.from(ingredientsIdsDebug.map((x) => x)),
        "ingredients_n": ingredientsN,
        "ingredients_n_tags":
            List<dynamic>.from(ingredientsNTags.map((x) => x)),
        "ingredients_original_tags":
            List<dynamic>.from(ingredientsOriginalTags.map((x) => x)),
        "ingredients_percent_analysis": ingredientsPercentAnalysis,
        "ingredients_tags": List<dynamic>.from(ingredientsTags.map((x) => x)),
        "ingredients_text": ingredientsText,
        "ingredients_text_debug": ingredientsTextDebug,
        "ingredients_text_en": ingredientsTextEn,
        "ingredients_text_en_debug_tags":
            List<dynamic>.from(ingredientsTextEnDebugTags.map((x) => x)),
        "ingredients_text_en_imported": ingredientsTextEnImported,
        "ingredients_text_with_allergens": ingredientsTextWithAllergens,
        "ingredients_text_with_allergens_en": ingredientsTextWithAllergensEn,
        "ingredients_that_may_be_from_palm_oil_n":
            ingredientsThatMayBeFromPalmOilN,
        "ingredients_that_may_be_from_palm_oil_tags": List<dynamic>.from(
            ingredientsThatMayBeFromPalmOilTags.map((x) => x)),
        "ingredients_with_specified_percent_n":
            ingredientsWithSpecifiedPercentN,
        "ingredients_with_specified_percent_sum":
            ingredientsWithSpecifiedPercentSum,
        "ingredients_with_unspecified_percent_n":
            ingredientsWithUnspecifiedPercentN,
        "ingredients_with_unspecified_percent_sum":
            ingredientsWithUnspecifiedPercentSum,
        "interface_version_created": interfaceVersionCreated,
        "interface_version_modified": interfaceVersionModified,
        "known_ingredients_n": knownIngredientsN,
        "labels": labels,
        "labels_hierarchy": List<dynamic>.from(labelsHierarchy.map((x) => x)),
        "labels_lc": labelsLc,
        "labels_old": labelsOld,
        "labels_tags": List<dynamic>.from(labelsTags.map((x) => x)),
        "lang": lang,
        "lang_debug_tags": List<dynamic>.from(langDebugTags.map((x) => x)),
        "languages": languages.toJson(),
        "languages_hierarchy":
            List<dynamic>.from(languagesHierarchy.map((x) => x)),
        "languages_tags": List<dynamic>.from(languagesTags.map((x) => x)),
        "last_edit_dates_tags":
            List<dynamic>.from(lastEditDatesTags.map((x) => x)),
        "last_editor": lastEditor,
        "last_image_dates_tags":
            List<dynamic>.from(lastImageDatesTags.map((x) => x)),
        "last_image_t": lastImageT,
        "last_modified_by": lastModifiedBy,
        "last_modified_t": lastModifiedT,
        "lc": lc,
        "lc_imported": lcImported,
        "link": link,
        "link_debug_tags": List<dynamic>.from(linkDebugTags.map((x) => x)),
        "main_countries_tags":
            List<dynamic>.from(mainCountriesTags.map((x) => x)),
        "manufacturing_places": manufacturingPlaces,
        "manufacturing_places_debug_tags":
            List<dynamic>.from(manufacturingPlacesDebugTags.map((x) => x)),
        "manufacturing_places_tags":
            List<dynamic>.from(manufacturingPlacesTags.map((x) => x)),
        "max_imgid": maxImgid,
        "minerals_prev_tags":
            List<dynamic>.from(mineralsPrevTags.map((x) => x)),
        "minerals_tags": List<dynamic>.from(mineralsTags.map((x) => x)),
        "misc_tags": List<dynamic>.from(miscTags.map((x) => x)),
        "new_additives_n": newAdditivesN,
        "no_nutrition_data": noNutritionData,
        "nova_group": novaGroup,
        "nova_group_debug": novaGroupDebug,
        "nova_groups": novaGroups,
        "nova_groups_markers": Map.from(novaGroupsMarkers).map((k, v) =>
            MapEntry<String, dynamic>(
                k,
                List<dynamic>.from(
                    v.map((x) => List<dynamic>.from(x.map((x) => x)))))),
        "nova_groups_tags": List<dynamic>.from(novaGroupsTags.map((x) => x)),
        "nucleotides_prev_tags":
            List<dynamic>.from(nucleotidesPrevTags.map((x) => x)),
        "nucleotides_tags": List<dynamic>.from(nucleotidesTags.map((x) => x)),
        "nutrient_levels": nutrientLevels.toJson(),
        "nutrient_levels_tags":
            List<dynamic>.from(nutrientLevelsTags.map((x) => x)),
        "nutriments": nutriments.toJson(),
        "nutriscore_data": nutriscoreData.toJson(),
        "nutriscore_grade": nutriscoreGrade,
        "nutriscore_score": nutriscoreScore,
        "nutriscore_score_opposite": nutriscoreScoreOpposite,
        "nutrition_data": nutritionData,
        "nutrition_data_per": nutritionDataPer,
        "nutrition_data_per_debug_tags":
            List<dynamic>.from(nutritionDataPerDebugTags.map((x) => x)),
        "nutrition_data_per_imported": nutritionDataPerImported,
        "nutrition_data_prepared": nutritionDataPrepared,
        "nutrition_data_prepared_per": nutritionDataPreparedPer,
        "nutrition_data_prepared_per_debug_tags":
            List<dynamic>.from(nutritionDataPreparedPerDebugTags.map((x) => x)),
        "nutrition_data_prepared_per_imported":
            nutritionDataPreparedPerImported,
        "nutrition_grade_fr": nutritionGradeFr,
        "nutrition_grades": nutritionGrades,
        "nutrition_grades_tags":
            List<dynamic>.from(nutritionGradesTags.map((x) => x)),
        "nutrition_score_beverage": nutritionScoreBeverage,
        "nutrition_score_debug": nutritionScoreDebug,
        "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients":
            nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredients,
        "nutrition_score_warning_fruits_vegetables_nuts_estimate_from_ingredients_value":
            nutritionScoreWarningFruitsVegetablesNutsEstimateFromIngredientsValue,
        "origins": origins,
        "origins_hierarchy": List<dynamic>.from(originsHierarchy.map((x) => x)),
        "origins_lc": originsLc,
        "origins_old": originsOld,
        "origins_tags": List<dynamic>.from(originsTags.map((x) => x)),
        "other_nutritional_substances_tags":
            List<dynamic>.from(otherNutritionalSubstancesTags.map((x) => x)),
        "packaging": packaging,
        "packaging_hierarchy":
            List<dynamic>.from(packagingHierarchy.map((x) => x)),
        "packaging_lc": packagingLc,
        "packaging_old": packagingOld,
        "packaging_old_before_taxonomization": packagingOldBeforeTaxonomization,
        "packaging_tags": List<dynamic>.from(packagingTags.map((x) => x)),
        "packagings": List<dynamic>.from(packagings.map((x) => x.toJson())),
        "photographers": List<dynamic>.from(photographers.map((x) => x)),
        "photographers_tags":
            List<dynamic>.from(photographersTags.map((x) => x)),
        "pnns_groups_1": pnnsGroups1,
        "pnns_groups_1_tags": List<dynamic>.from(pnnsGroups1Tags.map((x) => x)),
        "pnns_groups_2": pnnsGroups2,
        "pnns_groups_2_tags": List<dynamic>.from(pnnsGroups2Tags.map((x) => x)),
        "popularity_key": popularityKey,
        "popularity_tags": List<dynamic>.from(popularityTags.map((x) => x)),
        "product_name": productName,
        "product_name_en": productNameEn,
        "product_name_en_debug_tags":
            List<dynamic>.from(productNameEnDebugTags.map((x) => x)),
        "product_name_en_imported": productNameEnImported,
        "product_quantity": productQuantity,
        "purchase_places": purchasePlaces,
        "purchase_places_debug_tags":
            List<dynamic>.from(purchasePlacesDebugTags.map((x) => x)),
        "purchase_places_tags":
            List<dynamic>.from(purchasePlacesTags.map((x) => x)),
        "quantity": quantity,
        "quantity_debug_tags":
            List<dynamic>.from(quantityDebugTags.map((x) => x)),
        "removed_countries_tags":
            List<dynamic>.from(removedCountriesTags.map((x) => x)),
        "rev": rev,
        "scans_n": scansN,
        "selected_images": selectedImages.toJson(),
        "serving_quantity": servingQuantity,
        "serving_size": servingSize,
        "serving_size_debug_tags":
            List<dynamic>.from(servingSizeDebugTags.map((x) => x)),
        "serving_size_imported": servingSizeImported,
        "sortkey": sortkey,
        "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
        "sources_fields": sourcesFields.toJson(),
        "states": states,
        "states_hierarchy": List<dynamic>.from(statesHierarchy.map((x) => x)),
        "states_tags": List<dynamic>.from(statesTags.map((x) => x)),
        "stores": stores,
        "stores_debug_tags": List<dynamic>.from(storesDebugTags.map((x) => x)),
        "stores_tags": List<dynamic>.from(storesTags.map((x) => x)),
        "traces": traces,
        "traces_debug_tags": List<dynamic>.from(tracesDebugTags.map((x) => x)),
        "traces_from_ingredients": tracesFromIngredients,
        "traces_from_user": tracesFromUser,
        "traces_hierarchy": List<dynamic>.from(tracesHierarchy.map((x) => x)),
        "traces_tags": List<dynamic>.from(tracesTags.map((x) => x)),
        "unique_scans_n": uniqueScansN,
        "unknown_ingredients_n": unknownIngredientsN,
        "unknown_nutrients_tags":
            List<dynamic>.from(unknownNutrientsTags.map((x) => x)),
        "update_key": updateKey,
        "vitamins_prev_tags":
            List<dynamic>.from(vitaminsPrevTags.map((x) => x)),
        "vitamins_tags": List<dynamic>.from(vitaminsTags.map((x) => x)),
      };
}

class CategoriesProperties {
  CategoriesProperties();

  factory CategoriesProperties.fromJson(Map<String, dynamic> json) =>
      CategoriesProperties();

  Map<String, dynamic> toJson() => {};
}

class EcoscoreData {
  EcoscoreData({
    required this.adjustments,
    required this.agribalyse,
    required this.missing,
    required this.missingAgribalyseMatchWarning,
    required this.scores,
    required this.status,
  });

  Adjustments adjustments;
  Agribalyse agribalyse;
  Missing missing;
  int missingAgribalyseMatchWarning;
  CategoriesProperties scores;
  String status;

  factory EcoscoreData.fromJson(Map<String, dynamic> json) => EcoscoreData(
        adjustments: Adjustments.fromJson(json["adjustments"]),
        agribalyse: Agribalyse.fromJson(json["agribalyse"]),
        missing: Missing.fromJson(json["missing"]),
        missingAgribalyseMatchWarning: json["missing_agribalyse_match_warning"],
        scores: CategoriesProperties.fromJson(json["scores"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "adjustments": adjustments.toJson(),
        "agribalyse": agribalyse.toJson(),
        "missing": missing.toJson(),
        "missing_agribalyse_match_warning": missingAgribalyseMatchWarning,
        "scores": scores.toJson(),
        "status": status,
      };
}

class Adjustments {
  Adjustments({
    required this.originsOfIngredients,
    required this.packaging,
    required this.productionSystem,
    required this.threatenedSpecies,
  });

  OriginsOfIngredients originsOfIngredients;
  AdjustmentsPackaging packaging;
  ProductionSystem productionSystem;
  CategoriesProperties threatenedSpecies;

  factory Adjustments.fromJson(Map<String, dynamic> json) => Adjustments(
        originsOfIngredients:
            OriginsOfIngredients.fromJson(json["origins_of_ingredients"]),
        packaging: AdjustmentsPackaging.fromJson(json["packaging"]),
        productionSystem: ProductionSystem.fromJson(json["production_system"]),
        threatenedSpecies:
            CategoriesProperties.fromJson(json["threatened_species"]),
      );

  Map<String, dynamic> toJson() => {
        "origins_of_ingredients": originsOfIngredients.toJson(),
        "packaging": packaging.toJson(),
        "production_system": productionSystem.toJson(),
        "threatened_species": threatenedSpecies.toJson(),
      };
}

class OriginsOfIngredients {
  OriginsOfIngredients({
    required this.aggregatedOrigins,
    required this.epiScore,
    required this.epiValue,
    required this.originsFromOriginsField,
    required this.transportationScore,
    required this.transportationScores,
    required this.transportationValue,
    required this.transportationValues,
    required this.value,
    required this.values,
  });

  List<AggregatedOrigin> aggregatedOrigins;
  int epiScore;
  int epiValue;
  List<String> originsFromOriginsField;
  int transportationScore;
  Map<String, int> transportationScores;
  int transportationValue;
  Map<String, int> transportationValues;
  int value;
  Map<String, int> values;

  factory OriginsOfIngredients.fromJson(Map<String, dynamic> json) =>
      OriginsOfIngredients(
        aggregatedOrigins: List<AggregatedOrigin>.from(
            json["aggregated_origins"]
                .map((x) => AggregatedOrigin.fromJson(x))),
        epiScore: json["epi_score"],
        epiValue: json["epi_value"],
        originsFromOriginsField:
            List<String>.from(json["origins_from_origins_field"].map((x) => x)),
        transportationScore: json["transportation_score"],
        transportationScores: Map.from(json["transportation_scores"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        transportationValue: json["transportation_value"],
        transportationValues: Map.from(json["transportation_values"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        value: json["value"],
        values:
            Map.from(json["values"]).map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "aggregated_origins":
            List<dynamic>.from(aggregatedOrigins.map((x) => x.toJson())),
        "epi_score": epiScore,
        "epi_value": epiValue,
        "origins_from_origins_field":
            List<dynamic>.from(originsFromOriginsField.map((x) => x)),
        "transportation_score": transportationScore,
        "transportation_scores": Map.from(transportationScores)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "transportation_value": transportationValue,
        "transportation_values": Map.from(transportationValues)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "value": value,
        "values":
            Map.from(values).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class AggregatedOrigin {
  AggregatedOrigin({
    required this.epiScore,
    required this.origin,
    required this.percent,
    this.transportationScore,
  });

  String epiScore;
  String origin;
  int percent;
  dynamic transportationScore;

  factory AggregatedOrigin.fromJson(Map<String, dynamic> json) =>
      AggregatedOrigin(
        epiScore: json["epi_score"],
        origin: json["origin"],
        percent: json["percent"],
        transportationScore: json["transportation_score"],
      );

  Map<String, dynamic> toJson() => {
        "epi_score": epiScore,
        "origin": origin,
        "percent": percent,
        "transportation_score": transportationScore,
      };
}

class AdjustmentsPackaging {
  AdjustmentsPackaging({
    required this.nonRecyclableAndNonBiodegradableMaterials,
    required this.packagings,
    required this.score,
    required this.value,
    required this.warning,
  });

  int nonRecyclableAndNonBiodegradableMaterials;
  List<PackagingPackaging> packagings;
  int score;
  int value;
  String warning;

  factory AdjustmentsPackaging.fromJson(Map<String, dynamic> json) =>
      AdjustmentsPackaging(
        nonRecyclableAndNonBiodegradableMaterials:
            json["non_recyclable_and_non_biodegradable_materials"],
        packagings: List<PackagingPackaging>.from(
            json["packagings"].map((x) => PackagingPackaging.fromJson(x))),
        score: json["score"],
        value: json["value"],
        warning: json["warning"],
      );

  Map<String, dynamic> toJson() => {
        "non_recyclable_and_non_biodegradable_materials":
            nonRecyclableAndNonBiodegradableMaterials,
        "packagings": List<dynamic>.from(packagings.map((x) => x.toJson())),
        "score": score,
        "value": value,
        "warning": warning,
      };
}

class PackagingPackaging {
  PackagingPackaging({
    required this.ecoscoreMaterialScore,
    required this.ecoscoreShapeRatio,
    required this.material,
    required this.shape,
  });

  int ecoscoreMaterialScore;
  int ecoscoreShapeRatio;
  String material;
  String shape;

  factory PackagingPackaging.fromJson(Map<String, dynamic> json) =>
      PackagingPackaging(
        ecoscoreMaterialScore: json["ecoscore_material_score"],
        ecoscoreShapeRatio: json["ecoscore_shape_ratio"],
        material: json["material"],
        shape: json["shape"],
      );

  Map<String, dynamic> toJson() => {
        "ecoscore_material_score": ecoscoreMaterialScore,
        "ecoscore_shape_ratio": ecoscoreShapeRatio,
        "material": material,
        "shape": shape,
      };
}

class ProductionSystem {
  ProductionSystem({
    required this.labels,
    required this.value,
    required this.warning,
  });

  List<dynamic> labels;
  int value;
  String warning;

  factory ProductionSystem.fromJson(Map<String, dynamic> json) =>
      ProductionSystem(
        labels: List<dynamic>.from(json["labels"].map((x) => x)),
        value: json["value"],
        warning: json["warning"],
      );

  Map<String, dynamic> toJson() => {
        "labels": List<dynamic>.from(labels.map((x) => x)),
        "value": value,
        "warning": warning,
      };
}

class Agribalyse {
  Agribalyse({
    required this.warning,
  });

  String warning;

  factory Agribalyse.fromJson(Map<String, dynamic> json) => Agribalyse(
        warning: json["warning"],
      );

  Map<String, dynamic> toJson() => {
        "warning": warning,
      };
}

class Missing {
  Missing({
    required this.agbCategory,
    required this.labels,
    required this.packagings,
  });

  int agbCategory;
  int labels;
  int packagings;

  factory Missing.fromJson(Map<String, dynamic> json) => Missing(
        agbCategory: json["agb_category"],
        labels: json["labels"],
        packagings: json["packagings"],
      );

  Map<String, dynamic> toJson() => {
        "agb_category": agbCategory,
        "labels": labels,
        "packagings": packagings,
      };
}

class Images {
  Images({
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
    required this.the5,
    required this.front,
    required this.frontEn,
    required this.ingredients,
    required this.ingredientsEn,
    required this.nutrition,
    required this.nutritionEn,
  });

  The1 the1;
  The1 the2;
  The1 the3;
  The1 the4;
  The1 the5;
  FrontEnClass front;
  FrontEnClass frontEn;
  FrontEnClass ingredients;
  FrontEnClass ingredientsEn;
  FrontEnClass nutrition;
  FrontEnClass nutritionEn;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        the1: The1.fromJson(json["1"]),
        the2: The1.fromJson(json["2"]),
        the3: The1.fromJson(json["3"]),
        the4: The1.fromJson(json["4"]),
        the5: The1.fromJson(json["5"]),
        front: FrontEnClass.fromJson(json["front"]),
        frontEn: FrontEnClass.fromJson(json["front_en"]),
        ingredients: FrontEnClass.fromJson(json["ingredients"]),
        ingredientsEn: FrontEnClass.fromJson(json["ingredients_en"]),
        nutrition: FrontEnClass.fromJson(json["nutrition"]),
        nutritionEn: FrontEnClass.fromJson(json["nutrition_en"]),
      );

  Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
        "2": the2.toJson(),
        "3": the3.toJson(),
        "4": the4.toJson(),
        "5": the5.toJson(),
        "front": front.toJson(),
        "front_en": frontEn.toJson(),
        "ingredients": ingredients.toJson(),
        "ingredients_en": ingredientsEn.toJson(),
        "nutrition": nutrition.toJson(),
        "nutrition_en": nutritionEn.toJson(),
      };
}

class FrontEnClass {
  FrontEnClass({
    required this.geometry,
    required this.imgid,
    required this.normalize,
    required this.rev,
    required this.sizes,
    this.whiteMagic,
  });

  String geometry;
  String imgid;
  String normalize;
  String rev;
  Sizes sizes;
  dynamic whiteMagic;

  factory FrontEnClass.fromJson(Map<String, dynamic> json) => FrontEnClass(
        geometry: json["geometry"],
        imgid: json["imgid"],
        normalize: json["normalize"],
        rev: json["rev"],
        sizes: Sizes.fromJson(json["sizes"]),
        whiteMagic: json["white_magic"],
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry,
        "imgid": imgid,
        "normalize": normalize,
        "rev": rev,
        "sizes": sizes.toJson(),
        "white_magic": whiteMagic,
      };
}

class Sizes {
  Sizes({
    required this.the100,
    required this.the400,
    required this.full,
    required this.the200,
  });

  The100 the100;
  The100 the400;
  The100 full;
  The100 the200;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        the100: The100.fromJson(json["100"]),
        the400: The100.fromJson(json["400"]),
        full: The100.fromJson(json["full"]),
        the200: The100.fromJson(json["200"]),
      );

  Map<String, dynamic> toJson() => {
        "100": the100.toJson(),
        "400": the400.toJson(),
        "full": full.toJson(),
        "200": the200.toJson(),
      };
}

class The100 {
  The100({
    required this.h,
    required this.w,
  });

  int h;
  int w;

  factory The100.fromJson(Map<String, dynamic> json) => The100(
        h: json["h"],
        w: json["w"],
      );

  Map<String, dynamic> toJson() => {
        "h": h,
        "w": w,
      };
}

class The1 {
  The1({
    required this.sizes,
    required this.uploadedT,
    required this.uploader,
  });

  Sizes sizes;
  int uploadedT;
  String uploader;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        sizes: Sizes.fromJson(json["sizes"]),
        uploadedT: json["uploaded_t"],
        uploader: json["uploader"],
      );

  Map<String, dynamic> toJson() => {
        "sizes": sizes.toJson(),
        "uploaded_t": uploadedT,
        "uploader": uploader,
      };
}

class Ingredient {
  Ingredient({
    required this.hasSubIngredients,
    required this.id,
    required this.percentEstimate,
    required this.percentMax,
    required this.percentMin,
    required this.rank,
    required this.text,
    required this.vegan,
    required this.vegetarian,
    required this.processing,
  });

  HasSubIngredients hasSubIngredients;
  String id;
  double percentEstimate;
  double percentMax;
  double percentMin;
  int rank;
  String text;
  HasSubIngredients vegan;
  HasSubIngredients vegetarian;
  String processing;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        hasSubIngredients: hasSubIngredientsValues
            .map[json["has_sub_ingredients"]] as HasSubIngredients,
        id: json["id"],
        percentEstimate: json["percent_estimate"].toDouble(),
        percentMax: json["percent_max"].toDouble(),
        percentMin: json["percent_min"].toDouble(),
        rank: json["rank"],
        text: json["text"],
        vegan: hasSubIngredientsValues.map[json["vegan"]] as HasSubIngredients,
        vegetarian: hasSubIngredientsValues.map[json["vegetarian"]]
            as HasSubIngredients,
        processing: json["processing"],
      );

  Map<String, dynamic> toJson() => {
        "has_sub_ingredients":
            hasSubIngredientsValues.reverse[hasSubIngredients],
        "id": id,
        "percent_estimate": percentEstimate,
        "percent_max": percentMax,
        "percent_min": percentMin,
        "rank": rank,
        "text": text,
        "vegan": hasSubIngredientsValues.reverse[vegan],
        "vegetarian": hasSubIngredientsValues.reverse[vegetarian],
        "processing": processing,
      };
}

enum HasSubIngredients { YES }

final hasSubIngredientsValues = EnumValues({"yes": HasSubIngredients.YES});

class IngredientsAnalysis {
  IngredientsAnalysis({
    required this.enPalmOilContentUnknown,
    required this.enVeganStatusUnknown,
    required this.enVegetarianStatusUnknown,
  });

  List<String> enPalmOilContentUnknown;
  List<String> enVeganStatusUnknown;
  List<String> enVegetarianStatusUnknown;

  factory IngredientsAnalysis.fromJson(Map<String, dynamic> json) =>
      IngredientsAnalysis(
        enPalmOilContentUnknown: List<String>.from(
            json["en:palm-oil-content-unknown"].map((x) => x)),
        enVeganStatusUnknown:
            List<String>.from(json["en:vegan-status-unknown"].map((x) => x)),
        enVegetarianStatusUnknown: List<String>.from(
            json["en:vegetarian-status-unknown"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "en:palm-oil-content-unknown":
            List<dynamic>.from(enPalmOilContentUnknown.map((x) => x)),
        "en:vegan-status-unknown":
            List<dynamic>.from(enVeganStatusUnknown.map((x) => x)),
        "en:vegetarian-status-unknown":
            List<dynamic>.from(enVegetarianStatusUnknown.map((x) => x)),
      };
}

class Languages {
  Languages({
    required this.enEnglish,
  });

  int enEnglish;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        enEnglish: json["en:english"],
      );

  Map<String, dynamic> toJson() => {
        "en:english": enEnglish,
      };
}

class NutrientLevels {
  NutrientLevels({
    required this.fat,
    required this.salt,
    required this.saturatedFat,
    required this.sugars,
  });

  String fat;
  String salt;
  String saturatedFat;
  String sugars;

  factory NutrientLevels.fromJson(Map<String, dynamic> json) => NutrientLevels(
        fat: json["fat"],
        salt: json["salt"],
        saturatedFat: json["saturated-fat"],
        sugars: json["sugars"],
      );

  Map<String, dynamic> toJson() => {
        "fat": fat,
        "salt": salt,
        "saturated-fat": saturatedFat,
        "sugars": sugars,
      };
}

class Nutriments {
  Nutriments({
    required this.calcium,
    required this.calcium100G,
    required this.calciumServing,
    required this.calciumUnit,
    required this.calciumValue,
    required this.carbohydrates,
    required this.carbohydrates100G,
    required this.carbohydratesServing,
    required this.carbohydratesUnit,
    required this.carbohydratesValue,
    required this.cholesterol,
    required this.cholesterol100G,
    required this.cholesterolServing,
    required this.cholesterolUnit,
    required this.cholesterolValue,
    required this.energy,
    required this.energyKcal,
    required this.energyKcal100G,
    required this.energyKcalServing,
    required this.energyKcalUnit,
    required this.energyKcalValue,
    required this.energyKcalValueComputed,
    required this.energy100G,
    required this.energyServing,
    required this.energyUnit,
    required this.energyValue,
    required this.fat,
    required this.fat100G,
    required this.fatServing,
    required this.fatUnit,
    required this.fatValue,
    required this.fiber,
    required this.fiber100G,
    required this.fiberServing,
    required this.fiberUnit,
    required this.fiberValue,
    required this.fruitsVegetablesNutsEstimateFromIngredients100G,
    required this.fruitsVegetablesNutsEstimateFromIngredientsServing,
    required this.iron,
    required this.iron100G,
    required this.ironServing,
    required this.ironUnit,
    required this.ironValue,
    required this.novaGroup,
    required this.novaGroup100G,
    required this.novaGroupServing,
    required this.nutritionScoreFr,
    required this.nutritionScoreFr100G,
    required this.proteins,
    required this.proteins100G,
    required this.proteinsServing,
    required this.proteinsUnit,
    required this.proteinsValue,
    required this.salt,
    required this.salt100G,
    required this.saltServing,
    required this.saltUnit,
    required this.saltValue,
    required this.saturatedFat,
    required this.saturatedFat100G,
    required this.saturatedFatServing,
    required this.saturatedFatUnit,
    required this.saturatedFatValue,
    required this.sodium,
    required this.sodium100G,
    required this.sodiumServing,
    required this.sodiumUnit,
    required this.sodiumValue,
    required this.sugars,
    required this.sugars100G,
    required this.sugarsServing,
    required this.sugarsUnit,
    required this.sugarsValue,
    required this.transFat,
    required this.transFat100G,
    required this.transFatServing,
    required this.transFatUnit,
    required this.transFatValue,
    required this.vitaminA,
    required this.vitaminA100G,
    required this.vitaminAServing,
    required this.vitaminAUnit,
    required this.vitaminAValue,
    required this.vitaminC,
    required this.vitaminC100G,
    required this.vitaminCServing,
    required this.vitaminCUnit,
    required this.vitaminCValue,
  });

  double calcium;
  double calcium100G;
  double calciumServing;
  String calciumUnit;
  int calciumValue;
  double carbohydrates;
  double carbohydrates100G;
  int carbohydratesServing;
  String carbohydratesUnit;
  double carbohydratesValue;
  int cholesterol;
  int cholesterol100G;
  int cholesterolServing;
  String cholesterolUnit;
  int cholesterolValue;
  int energy;
  int energyKcal;
  int energyKcal100G;
  int energyKcalServing;
  String energyKcalUnit;
  int energyKcalValue;
  double energyKcalValueComputed;
  int energy100G;
  int energyServing;
  String energyUnit;
  int energyValue;
  double fat;
  double fat100G;
  int fatServing;
  String fatUnit;
  double fatValue;
  double fiber;
  double fiber100G;
  double fiberServing;
  String fiberUnit;
  double fiberValue;
  int fruitsVegetablesNutsEstimateFromIngredients100G;
  int fruitsVegetablesNutsEstimateFromIngredientsServing;
  double iron;
  double iron100G;
  double ironServing;
  String ironUnit;
  double ironValue;
  int novaGroup;
  int novaGroup100G;
  int novaGroupServing;
  int nutritionScoreFr;
  int nutritionScoreFr100G;
  double proteins;
  double proteins100G;
  int proteinsServing;
  String proteinsUnit;
  double proteinsValue;
  double salt;
  double salt100G;
  double saltServing;
  String saltUnit;
  int saltValue;
  double saturatedFat;
  double saturatedFat100G;
  double saturatedFatServing;
  String saturatedFatUnit;
  double saturatedFatValue;
  double sodium;
  double sodium100G;
  double sodiumServing;
  String sodiumUnit;
  int sodiumValue;
  double sugars;
  double sugars100G;
  int sugarsServing;
  String sugarsUnit;
  double sugarsValue;
  int transFat;
  int transFat100G;
  int transFatServing;
  String transFatUnit;
  int transFatValue;
  double vitaminA;
  double vitaminA100G;
  double vitaminAServing;
  String vitaminAUnit;
  int vitaminAValue;
  int vitaminC;
  int vitaminC100G;
  int vitaminCServing;
  String vitaminCUnit;
  int vitaminCValue;

  factory Nutriments.fromJson(Map<String, dynamic> json) => Nutriments(
        calcium: json["calcium"].toDouble(),
        calcium100G: json["calcium_100g"].toDouble(),
        calciumServing: json["calcium_serving"].toDouble(),
        calciumUnit: json["calcium_unit"],
        calciumValue: json["calcium_value"],
        carbohydrates: json["carbohydrates"].toDouble(),
        carbohydrates100G: json["carbohydrates_100g"].toDouble(),
        carbohydratesServing: json["carbohydrates_serving"],
        carbohydratesUnit: json["carbohydrates_unit"],
        carbohydratesValue: json["carbohydrates_value"].toDouble(),
        cholesterol: json["cholesterol"],
        cholesterol100G: json["cholesterol_100g"],
        cholesterolServing: json["cholesterol_serving"],
        cholesterolUnit: json["cholesterol_unit"],
        cholesterolValue: json["cholesterol_value"],
        energy: json["energy"],
        energyKcal: json["energy-kcal"],
        energyKcal100G: json["energy-kcal_100g"],
        energyKcalServing: json["energy-kcal_serving"],
        energyKcalUnit: json["energy-kcal_unit"],
        energyKcalValue: json["energy-kcal_value"],
        energyKcalValueComputed: json["energy-kcal_value_computed"].toDouble(),
        energy100G: json["energy_100g"],
        energyServing: json["energy_serving"],
        energyUnit: json["energy_unit"],
        energyValue: json["energy_value"],
        fat: json["fat"].toDouble(),
        fat100G: json["fat_100g"].toDouble(),
        fatServing: json["fat_serving"],
        fatUnit: json["fat_unit"],
        fatValue: json["fat_value"].toDouble(),
        fiber: json["fiber"].toDouble(),
        fiber100G: json["fiber_100g"].toDouble(),
        fiberServing: json["fiber_serving"].toDouble(),
        fiberUnit: json["fiber_unit"],
        fiberValue: json["fiber_value"].toDouble(),
        fruitsVegetablesNutsEstimateFromIngredients100G:
            json["fruits-vegetables-nuts-estimate-from-ingredients_100g"],
        fruitsVegetablesNutsEstimateFromIngredientsServing:
            json["fruits-vegetables-nuts-estimate-from-ingredients_serving"],
        iron: json["iron"].toDouble(),
        iron100G: json["iron_100g"].toDouble(),
        ironServing: json["iron_serving"].toDouble(),
        ironUnit: json["iron_unit"],
        ironValue: json["iron_value"].toDouble(),
        novaGroup: json["nova-group"],
        novaGroup100G: json["nova-group_100g"],
        novaGroupServing: json["nova-group_serving"],
        nutritionScoreFr: json["nutrition-score-fr"],
        nutritionScoreFr100G: json["nutrition-score-fr_100g"],
        proteins: json["proteins"].toDouble(),
        proteins100G: json["proteins_100g"].toDouble(),
        proteinsServing: json["proteins_serving"],
        proteinsUnit: json["proteins_unit"],
        proteinsValue: json["proteins_value"].toDouble(),
        salt: json["salt"].toDouble(),
        salt100G: json["salt_100g"].toDouble(),
        saltServing: json["salt_serving"].toDouble(),
        saltUnit: json["salt_unit"],
        saltValue: json["salt_value"],
        saturatedFat: json["saturated-fat"].toDouble(),
        saturatedFat100G: json["saturated-fat_100g"].toDouble(),
        saturatedFatServing: json["saturated-fat_serving"].toDouble(),
        saturatedFatUnit: json["saturated-fat_unit"],
        saturatedFatValue: json["saturated-fat_value"].toDouble(),
        sodium: json["sodium"].toDouble(),
        sodium100G: json["sodium_100g"].toDouble(),
        sodiumServing: json["sodium_serving"].toDouble(),
        sodiumUnit: json["sodium_unit"],
        sodiumValue: json["sodium_value"],
        sugars: json["sugars"].toDouble(),
        sugars100G: json["sugars_100g"].toDouble(),
        sugarsServing: json["sugars_serving"],
        sugarsUnit: json["sugars_unit"],
        sugarsValue: json["sugars_value"].toDouble(),
        transFat: json["trans-fat"],
        transFat100G: json["trans-fat_100g"],
        transFatServing: json["trans-fat_serving"],
        transFatUnit: json["trans-fat_unit"],
        transFatValue: json["trans-fat_value"],
        vitaminA: json["vitamin-a"].toDouble(),
        vitaminA100G: json["vitamin-a_100g"].toDouble(),
        vitaminAServing: json["vitamin-a_serving"].toDouble(),
        vitaminAUnit: json["vitamin-a_unit"],
        vitaminAValue: json["vitamin-a_value"],
        vitaminC: json["vitamin-c"],
        vitaminC100G: json["vitamin-c_100g"],
        vitaminCServing: json["vitamin-c_serving"],
        vitaminCUnit: json["vitamin-c_unit"],
        vitaminCValue: json["vitamin-c_value"],
      );

  Map<String, dynamic> toJson() => {
        "calcium": calcium,
        "calcium_100g": calcium100G,
        "calcium_serving": calciumServing,
        "calcium_unit": calciumUnit,
        "calcium_value": calciumValue,
        "carbohydrates": carbohydrates,
        "carbohydrates_100g": carbohydrates100G,
        "carbohydrates_serving": carbohydratesServing,
        "carbohydrates_unit": carbohydratesUnit,
        "carbohydrates_value": carbohydratesValue,
        "cholesterol": cholesterol,
        "cholesterol_100g": cholesterol100G,
        "cholesterol_serving": cholesterolServing,
        "cholesterol_unit": cholesterolUnit,
        "cholesterol_value": cholesterolValue,
        "energy": energy,
        "energy-kcal": energyKcal,
        "energy-kcal_100g": energyKcal100G,
        "energy-kcal_serving": energyKcalServing,
        "energy-kcal_unit": energyKcalUnit,
        "energy-kcal_value": energyKcalValue,
        "energy-kcal_value_computed": energyKcalValueComputed,
        "energy_100g": energy100G,
        "energy_serving": energyServing,
        "energy_unit": energyUnit,
        "energy_value": energyValue,
        "fat": fat,
        "fat_100g": fat100G,
        "fat_serving": fatServing,
        "fat_unit": fatUnit,
        "fat_value": fatValue,
        "fiber": fiber,
        "fiber_100g": fiber100G,
        "fiber_serving": fiberServing,
        "fiber_unit": fiberUnit,
        "fiber_value": fiberValue,
        "fruits-vegetables-nuts-estimate-from-ingredients_100g":
            fruitsVegetablesNutsEstimateFromIngredients100G,
        "fruits-vegetables-nuts-estimate-from-ingredients_serving":
            fruitsVegetablesNutsEstimateFromIngredientsServing,
        "iron": iron,
        "iron_100g": iron100G,
        "iron_serving": ironServing,
        "iron_unit": ironUnit,
        "iron_value": ironValue,
        "nova-group": novaGroup,
        "nova-group_100g": novaGroup100G,
        "nova-group_serving": novaGroupServing,
        "nutrition-score-fr": nutritionScoreFr,
        "nutrition-score-fr_100g": nutritionScoreFr100G,
        "proteins": proteins,
        "proteins_100g": proteins100G,
        "proteins_serving": proteinsServing,
        "proteins_unit": proteinsUnit,
        "proteins_value": proteinsValue,
        "salt": salt,
        "salt_100g": salt100G,
        "salt_serving": saltServing,
        "salt_unit": saltUnit,
        "salt_value": saltValue,
        "saturated-fat": saturatedFat,
        "saturated-fat_100g": saturatedFat100G,
        "saturated-fat_serving": saturatedFatServing,
        "saturated-fat_unit": saturatedFatUnit,
        "saturated-fat_value": saturatedFatValue,
        "sodium": sodium,
        "sodium_100g": sodium100G,
        "sodium_serving": sodiumServing,
        "sodium_unit": sodiumUnit,
        "sodium_value": sodiumValue,
        "sugars": sugars,
        "sugars_100g": sugars100G,
        "sugars_serving": sugarsServing,
        "sugars_unit": sugarsUnit,
        "sugars_value": sugarsValue,
        "trans-fat": transFat,
        "trans-fat_100g": transFat100G,
        "trans-fat_serving": transFatServing,
        "trans-fat_unit": transFatUnit,
        "trans-fat_value": transFatValue,
        "vitamin-a": vitaminA,
        "vitamin-a_100g": vitaminA100G,
        "vitamin-a_serving": vitaminAServing,
        "vitamin-a_unit": vitaminAUnit,
        "vitamin-a_value": vitaminAValue,
        "vitamin-c": vitaminC,
        "vitamin-c_100g": vitaminC100G,
        "vitamin-c_serving": vitaminCServing,
        "vitamin-c_unit": vitaminCUnit,
        "vitamin-c_value": vitaminCValue,
      };
}

class NutriscoreData {
  NutriscoreData({
    required this.energy,
    required this.energyPoints,
    required this.energyValue,
    required this.fiber,
    required this.fiberPoints,
    required this.fiberValue,
    required this.fruitsVegetablesNutsColzaWalnutOliveOils,
    required this.fruitsVegetablesNutsColzaWalnutOliveOilsPoints,
    required this.fruitsVegetablesNutsColzaWalnutOliveOilsValue,
    required this.grade,
    required this.isBeverage,
    required this.isCheese,
    required this.isFat,
    required this.isWater,
    required this.negativePoints,
    required this.positivePoints,
    required this.proteins,
    required this.proteinsPoints,
    required this.proteinsValue,
    required this.saturatedFat,
    required this.saturatedFatPoints,
    required this.saturatedFatRatio,
    required this.saturatedFatRatioPoints,
    required this.saturatedFatRatioValue,
    required this.saturatedFatValue,
    required this.score,
    required this.sodium,
    required this.sodiumPoints,
    required this.sodiumValue,
    required this.sugars,
    required this.sugarsPoints,
    required this.sugarsValue,
  });

  int energy;
  int energyPoints;
  int energyValue;
  double fiber;
  int fiberPoints;
  double fiberValue;
  int fruitsVegetablesNutsColzaWalnutOliveOils;
  int fruitsVegetablesNutsColzaWalnutOliveOilsPoints;
  int fruitsVegetablesNutsColzaWalnutOliveOilsValue;
  String grade;
  int isBeverage;
  int isCheese;
  int isFat;
  int isWater;
  int negativePoints;
  int positivePoints;
  double proteins;
  int proteinsPoints;
  double proteinsValue;
  double saturatedFat;
  int saturatedFatPoints;
  double saturatedFatRatio;
  int saturatedFatRatioPoints;
  int saturatedFatRatioValue;
  double saturatedFatValue;
  int score;
  int sodium;
  int sodiumPoints;
  int sodiumValue;
  double sugars;
  int sugarsPoints;
  double sugarsValue;

  factory NutriscoreData.fromJson(Map<String, dynamic> json) => NutriscoreData(
        energy: json["energy"],
        energyPoints: json["energy_points"],
        energyValue: json["energy_value"],
        fiber: json["fiber"].toDouble(),
        fiberPoints: json["fiber_points"],
        fiberValue: json["fiber_value"].toDouble(),
        fruitsVegetablesNutsColzaWalnutOliveOils:
            json["fruits_vegetables_nuts_colza_walnut_olive_oils"],
        fruitsVegetablesNutsColzaWalnutOliveOilsPoints:
            json["fruits_vegetables_nuts_colza_walnut_olive_oils_points"],
        fruitsVegetablesNutsColzaWalnutOliveOilsValue:
            json["fruits_vegetables_nuts_colza_walnut_olive_oils_value"],
        grade: json["grade"],
        isBeverage: json["is_beverage"],
        isCheese: json["is_cheese"],
        isFat: json["is_fat"],
        isWater: json["is_water"],
        negativePoints: json["negative_points"],
        positivePoints: json["positive_points"],
        proteins: json["proteins"].toDouble(),
        proteinsPoints: json["proteins_points"],
        proteinsValue: json["proteins_value"].toDouble(),
        saturatedFat: json["saturated_fat"].toDouble(),
        saturatedFatPoints: json["saturated_fat_points"],
        saturatedFatRatio: json["saturated_fat_ratio"].toDouble(),
        saturatedFatRatioPoints: json["saturated_fat_ratio_points"],
        saturatedFatRatioValue: json["saturated_fat_ratio_value"],
        saturatedFatValue: json["saturated_fat_value"].toDouble(),
        score: json["score"],
        sodium: json["sodium"],
        sodiumPoints: json["sodium_points"],
        sodiumValue: json["sodium_value"],
        sugars: json["sugars"].toDouble(),
        sugarsPoints: json["sugars_points"],
        sugarsValue: json["sugars_value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "energy": energy,
        "energy_points": energyPoints,
        "energy_value": energyValue,
        "fiber": fiber,
        "fiber_points": fiberPoints,
        "fiber_value": fiberValue,
        "fruits_vegetables_nuts_colza_walnut_olive_oils":
            fruitsVegetablesNutsColzaWalnutOliveOils,
        "fruits_vegetables_nuts_colza_walnut_olive_oils_points":
            fruitsVegetablesNutsColzaWalnutOliveOilsPoints,
        "fruits_vegetables_nuts_colza_walnut_olive_oils_value":
            fruitsVegetablesNutsColzaWalnutOliveOilsValue,
        "grade": grade,
        "is_beverage": isBeverage,
        "is_cheese": isCheese,
        "is_fat": isFat,
        "is_water": isWater,
        "negative_points": negativePoints,
        "positive_points": positivePoints,
        "proteins": proteins,
        "proteins_points": proteinsPoints,
        "proteins_value": proteinsValue,
        "saturated_fat": saturatedFat,
        "saturated_fat_points": saturatedFatPoints,
        "saturated_fat_ratio": saturatedFatRatio,
        "saturated_fat_ratio_points": saturatedFatRatioPoints,
        "saturated_fat_ratio_value": saturatedFatRatioValue,
        "saturated_fat_value": saturatedFatValue,
        "score": score,
        "sodium": sodium,
        "sodium_points": sodiumPoints,
        "sodium_value": sodiumValue,
        "sugars": sugars,
        "sugars_points": sugarsPoints,
        "sugars_value": sugarsValue,
      };
}

class ProductPackaging {
  ProductPackaging({
    required this.shape,
  });

  String shape;

  factory ProductPackaging.fromJson(Map<String, dynamic> json) =>
      ProductPackaging(
        shape: json["shape"],
      );

  Map<String, dynamic> toJson() => {
        "shape": shape,
      };
}

class SelectedImages {
  SelectedImages({
    required this.front,
    required this.ingredients,
    required this.nutrition,
  });

  SelectedImagesFront front;
  SelectedImagesFront ingredients;
  SelectedImagesFront nutrition;

  factory SelectedImages.fromJson(Map<String, dynamic> json) => SelectedImages(
        front: SelectedImagesFront.fromJson(json["front"]),
        ingredients: SelectedImagesFront.fromJson(json["ingredients"]),
        nutrition: SelectedImagesFront.fromJson(json["nutrition"]),
      );

  Map<String, dynamic> toJson() => {
        "front": front.toJson(),
        "ingredients": ingredients.toJson(),
        "nutrition": nutrition.toJson(),
      };
}

class SelectedImagesFront {
  SelectedImagesFront({
    required this.display,
    required this.small,
    required this.thumb,
  });

  Display display;
  Display small;
  Display thumb;

  factory SelectedImagesFront.fromJson(Map<String, dynamic> json) =>
      SelectedImagesFront(
        display: Display.fromJson(json["display"]),
        small: Display.fromJson(json["small"]),
        thumb: Display.fromJson(json["thumb"]),
      );

  Map<String, dynamic> toJson() => {
        "display": display.toJson(),
        "small": small.toJson(),
        "thumb": thumb.toJson(),
      };
}

class Display {
  Display({
    required this.en,
  });

  String en;

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class Source {
  Source({
    required this.fields,
    required this.id,
    required this.images,
    required this.importT,
    required this.url,
    required this.manufacturer,
    required this.name,
  });

  List<String> fields;
  String id;
  List<dynamic> images;
  int importT;
  String url;
  dynamic manufacturer;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        fields: List<String>.from(json["fields"].map((x) => x)),
        id: json["id"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        importT: json["import_t"],
        url: json["url"],
        manufacturer: json["manufacturer"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "fields": List<dynamic>.from(fields.map((x) => x)),
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "import_t": importT,
        "url": url,
        "manufacturer": manufacturer,
        "name": name,
      };
}

class SourcesFields {
  SourcesFields({
    required this.orgDatabaseUsda,
  });

  OrgDatabaseUsda orgDatabaseUsda;

  factory SourcesFields.fromJson(Map<String, dynamic> json) => SourcesFields(
        orgDatabaseUsda: OrgDatabaseUsda.fromJson(json["org-database-usda"]),
      );

  Map<String, dynamic> toJson() => {
        "org-database-usda": orgDatabaseUsda.toJson(),
      };
}

class OrgDatabaseUsda {
  OrgDatabaseUsda({
    required this.availableDate,
    required this.fdcCategory,
    required this.fdcDataSource,
    required this.fdcId,
    required this.modifiedDate,
    required this.publicationDate,
  });

  DateTime availableDate;
  String fdcCategory;
  String fdcDataSource;
  String fdcId;
  DateTime modifiedDate;
  DateTime publicationDate;

  factory OrgDatabaseUsda.fromJson(Map<String, dynamic> json) =>
      OrgDatabaseUsda(
        availableDate: DateTime.parse(json["available_date"]),
        fdcCategory: json["fdc_category"],
        fdcDataSource: json["fdc_data_source"],
        fdcId: json["fdc_id"],
        modifiedDate: DateTime.parse(json["modified_date"]),
        publicationDate: DateTime.parse(json["publication_date"]),
      );

  Map<String, dynamic> toJson() => {
        "available_date": availableDate.toIso8601String(),
        "fdc_category": fdcCategory,
        "fdc_data_source": fdcDataSource,
        "fdc_id": fdcId,
        "modified_date": modifiedDate.toIso8601String(),
        "publication_date": publicationDate.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
