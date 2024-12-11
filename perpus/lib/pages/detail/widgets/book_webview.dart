import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:perpus/models/book.dart';

class BookWebView extends StatefulWidget {
  final Book book;

  const BookWebView({required this.book, super.key});

  @override
  _BookWebViewState createState() => _BookWebViewState();
}

class _BookWebViewState extends State<BookWebView> {
  late WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print('WebView initialization');
  }

  void _handleLoad(String url) {
    setState(() {
      isLoading = false;
    });
    print('Finished loading: $url');
  }

  void _handleError(WebResourceError error) {
    setState(() {
      isLoading = false;
    });
    print('Error loading page: ${error.description}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.book.fullTextUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
              print('WebView created');
            },
            onPageFinished: _handleLoad,
            onWebResourceError: _handleError,
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
