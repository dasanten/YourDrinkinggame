import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';


@Openapi(
    additionalProperties:
    AdditionalProperties(pubName: 'drinkinggame_api', pubAuthor: 'dasanten'),
    inputSpecFile: '../backend/src/main/resources/openapi.yml',
    generatorName: Generator.dio,
    outputDirectory: 'api/drinkinggame',)
class Example extends OpenapiGeneratorConfig {}
