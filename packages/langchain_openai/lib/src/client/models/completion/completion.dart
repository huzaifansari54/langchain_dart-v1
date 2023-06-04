import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template openai_completion_model}
/// This represents the response from a completion request.
/// {@endtemplate}
@immutable
final class OpenAICompletionModel {
  /// The ID of the completion.
  final String id;

  /// The date the completion was created.
  final DateTime created;

  /// The model used to generate the completion.
  final String model;

  /// The choices generated by the completion.
  final List<OpenAICompletionModelChoice> choices;

  /// The usage of the completion, if any.
  final OpenAICompletionModelUsage? usage;

  /// Whether the completion have at least one choice in [choices].
  bool get haveChoices => choices.isNotEmpty;

  @override
  int get hashCode {
    return id.hashCode ^ created.hashCode ^ model.hashCode ^ choices.hashCode;
  }

  /// {@macro openai_completion_model}
  const OpenAICompletionModel({
    required this.id,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  @override
  String toString() {
    return 'OpenAICompletionModel(id: $id, created: $created, model: $model, choices: $choices)';
  }

  @override
  bool operator ==(covariant final OpenAICompletionModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.created == created &&
        other.model == model &&
        listEquals(other.choices, choices);
  }
}

/// {@template openai_completion_model_choice}
/// This class is used to represent a choice generated by a completion request.
/// {@endtemplate}
@immutable
final class OpenAICompletionModelChoice {
  /// The text generated by the completion.
  final String text;

  /// The index of the choice.
  final int index;

  /// The log probabilities of the tokens in the completion.
  final int? logprobs;

  /// The reason the completion finished.
  final String? finishReason;

  @override
  int get hashCode {
    return text.hashCode ^
        index.hashCode ^
        logprobs.hashCode ^
        finishReason.hashCode;
  }

  /// {@macro openai_completion_model_choice}
  const OpenAICompletionModelChoice({
    required this.text,
    required this.index,
    required this.logprobs,
    required this.finishReason,
  });

  /// {@macro openai_completion_model_choice}
  /// This method is used to convert a [Map<String, dynamic>] object to a [OpenAICompletionModelChoice] object.
  factory OpenAICompletionModelChoice.fromMap(final Map<String, dynamic> json) {
    return OpenAICompletionModelChoice(
      text: json['text'],
      index: json['index'],
      logprobs: json['logprobs'],
      finishReason: json['finishReason'],
    );
  }

  @override
  bool operator ==(covariant final OpenAICompletionModelChoice other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.index == index &&
        other.logprobs == logprobs &&
        other.finishReason == finishReason;
  }

  @override
  String toString() {
    return 'OpenAICompletionModelChoice(text: $text, index: $index, logprobs: '
        '$logprobs, finishReason: $finishReason)';
  }
}

/// {@template openai_completion_model_usage}
/// This represents the usage of a completion response.
/// {@endtemplate}
@immutable
final class OpenAICompletionModelUsage {
  /// The number of tokens in the prompt.
  final int? promptTokens;

  /// The number of tokens in the completion.
  final int? completionTokens;

  /// The total number of tokens in the prompt and completion.
  final int? totalTokens;

  @override
  int get hashCode =>
      promptTokens.hashCode ^ completionTokens.hashCode ^ totalTokens.hashCode;

  /// {@macro openai_completion_model_usage}
  const OpenAICompletionModelUsage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  /// {@macro openai_completion_model_usage}
  /// This method is used to convert a [Map<String, dynamic>] object to a [OpenAICompletionModelUsage] object.
  factory OpenAICompletionModelUsage.fromMap(final Map<String, dynamic> json) {
    return OpenAICompletionModelUsage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
    );
  }

  @override
  bool operator ==(covariant final OpenAICompletionModelUsage other) {
    if (identical(this, other)) return true;

    return other.promptTokens == promptTokens &&
        other.completionTokens == completionTokens &&
        other.totalTokens == totalTokens;
  }

  @override
  String toString() =>
      'OpenAICompletionModelUsage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
}
