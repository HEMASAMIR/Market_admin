import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Comments", isBackButton: true),
      body: ListView.builder(
        itemBuilder: (context, index) => CommentCard(),
        itemCount: 10,
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  CommentCard({super.key});
  final TextEditingController replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Column(
          children: [
            const Text(
              "Comment : This Is User Comment",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text("Reply : This Is Replay"),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                labelText: 'Replay',
                controller: replyController,
              ),
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(child: const Text("Reply"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
