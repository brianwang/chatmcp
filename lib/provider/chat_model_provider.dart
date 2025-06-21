import 'package:chatmcp/provider/provider_manager.dart';
import 'package:flutter/material.dart';
import 'package:chatmcp/llm/model.dart' as llm_model;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatmcp/llm/base_llm_client.dart';
import 'dart:convert';

class ChatModelProvider extends ChangeNotifier {
  List<llm_model.Model> _availableModels = [];
  bool _isLoading = false;

  List<llm_model.Model> get availableModels => _availableModels;
  bool get isLoading => _isLoading;
  static final ChatModelProvider _instance = ChatModelProvider._internal();
  factory ChatModelProvider() => _instance;
  ChatModelProvider._internal() {
    _loadSavedModel();
  }

  Future<void> updateAvailableModels(List<llm_model.Model> models) async {
    _availableModels = models;
    notifyListeners();
  }

  Future<void> init() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    try {
      // Wait for SettingsProvider to be fully initialized
      await ProviderManager.settingsProvider.loadSettings();

      final client = BaseLLMClient.createClient(
        ProviderManager.settingsProvider.apiSettings.first,
      );
      _availableModels = await client.listModels();

      if (_currentModel == null && _availableModels.isNotEmpty) {
        // Try to find saved model first
        await _loadSavedModel();

        // If still no model selected, use first available
        if (_currentModel == null) {
          _currentModel = _availableModels.first;
          await _saveSavedModel();
        }
      }
    } catch (e, stack) {
      debugPrint('Failed to load models: $e\n$stack');
      _availableModels = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get the currently selected model
  static const String _modelKey = 'current_model';
  llm_model.Model? _currentModel;

  llm_model.Model get currentModel {
    if (_currentModel == null) {
      throw StateError('No model selected. Please select a model first.');
    }
    return _currentModel!;
  }

  set currentModel(llm_model.Model model) {
    _currentModel = model;
    _saveSavedModel();
    notifyListeners();
  }

  Future<void> _loadSavedModel() async {
    final prefs = await SharedPreferences.getInstance();
    final modelName = prefs.getString(_modelKey) ?? "";
    if (modelName.isNotEmpty) {
      _currentModel = llm_model.Model.fromJson(jsonDecode(modelName));
    }
    notifyListeners();
  }

  Future<void> _saveSavedModel() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_modelKey, _currentModel.toString());
  }
}
