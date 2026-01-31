import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_dicoding/core/state/result_state.dart';
import 'package:resto_app_dicoding/provider/detail/add_review_provider.dart';
import 'package:resto_app_dicoding/provider/detail/restaurant_detail_provider.dart';

class AddReviewForm extends StatefulWidget {
  final String restaurantId;

  const AddReviewForm({super.key, required this.restaurantId});

  @override
  State<AddReviewForm> createState() => _AddReviewFormState();
}

class _AddReviewFormState extends State<AddReviewForm> {
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<AddReviewProvider>().submitReview(
      restaurantId: widget.restaurantId,
      name: _nameController.text,
      review: _reviewController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddReviewProvider>(
      builder: (context, provider, _) {
        if (provider.state == ResultState.success) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _nameController.clear();
            _reviewController.clear();

            context.read<RestaurantDetailProvider>().fetchRestaurantDetail(
              widget.restaurantId,
            );

            provider.reset();
          });
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Review', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Your Name'),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Your Review'),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.state == ResultState.loading
                    ? null
                    : _submit,
                child: provider.state == ResultState.loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Submit Review'),
              ),
            ),

            if (provider.state == ResultState.error)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  provider.message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),

            if (provider.state == ResultState.success)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Review added successfully!',
                  style: TextStyle(color: Colors.green),
                ),
              ),
          ],
        );
      },
    );
  }
}
