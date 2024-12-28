import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/speech/v1.dart';

void main() {
  runApp(SpeechToTextApp());
}

class SpeechToTextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpeechRecognitionPage(),
    );
  }
}

class SpeechRecognitionPage extends StatefulWidget {
  @override
  _SpeechRecognitionPageState createState() => _SpeechRecognitionPageState();
}

class _SpeechRecognitionPageState extends State<SpeechRecognitionPage> {
  String _transcription = "Press the button to start transcription.";
  bool _isProcessing = false;

  /// Authenticate with Google API using the service account credentials file.
  Future<AutoRefreshingAuthClient> _getAuthClient() async {
    try {
      final credentialsJson = await rootBundle.loadString('assets/speech-to-text-credentials.json');
      final accountCredentials = ServiceAccountCredentials.fromJson(credentialsJson);
      return await clientViaServiceAccount(accountCredentials, [SpeechApi.cloudPlatformScope]);
    } catch (e) {
      print("Error loading credentials: $e");
      rethrow;
    }
  }

  /// Transcribe the speech from the audio file using Google Speech-to-Text API.
  Future<String?> _transcribeSpeechBytes(Uint8List audioBytes) async {
    try {
      final client = await _getAuthClient();
      final speechApi = SpeechApi(client);

      final base64Audio = base64Encode(audioBytes);

      final recognitionAudio = RecognitionAudio(content: base64Audio);
      final recognitionConfig = RecognitionConfig(
        encoding: "MP3",
        sampleRateHertz: 16000,
        languageCode: "ms-MY", // Malay language code
      );

      final request = RecognizeRequest(audio: recognitionAudio, config: recognitionConfig);
      final response = await speechApi.speech.recognize(request);

      client.close();

      if (response.results != null && response.results!.isNotEmpty) {
        return response.results!
            .map((result) => result.alternatives?.first.transcript ?? "")
            .join("\n");
      } else {
        return "No transcription results.";
      }
    } catch (e) {
      print("Error transcribing audio: $e");
      return "Error transcribing audio.";
    }
  }

  /// Process the audio file and transcribe its content.
  void _processAudio() async {
    setState(() {
      _isProcessing = true;
    });

    try {
      // Load the audio file from assets
      ByteData audioData = await rootBundle.load('assets/Bibi baru beli baju itu.mp3');
      Uint8List audioBytes = audioData.buffer.asUint8List();

      String? transcription = await _transcribeSpeechBytes(audioBytes);

      setState(() {
        _transcription = transcription ?? "No transcription available.";
        _isProcessing = false;
      });
    } catch (e) {
      setState(() {
        _transcription = "Error processing audio: $e";
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech-to-Text App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _transcription,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isProcessing ? null : _processAudio,
              child: _isProcessing
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Start Transcription'),
            ),
          ],
        ),
      ),
    );
  }
}
