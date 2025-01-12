import 'package:farego/commen/app_colors.dart';
import 'package:flutter/material.dart';

enum DocumentStatus { upload, uploading, uploaded }

class DocumentRow extends StatelessWidget {
  final Map dObj;
  final VoidCallback onPressed;
  final VoidCallback onInfo;
  final VoidCallback onUpload;
  final VoidCallback onAction;
  final DocumentStatus Status;

  const DocumentRow({
    super.key,
    required this.dObj,
    required this.onPressed,
    required this.onInfo,
    required this.onUpload,
    required this.onAction,
    required this.Status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300, // Subtle border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            dObj["name"] as String? ?? "No Name",
                            style: TextStyle(
                              color: AppColors.darkNavy,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                              onTap: onInfo,
                              child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors
                                          .transparent, // Transparent to allow rounded corners
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 46, horizontal: 20),
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .white, // Modal background color
                                            borderRadius: BorderRadius.circular(
                                                20), // Rounded corners
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 10,
                                                offset: const Offset(0,
                                                    4), // Subtle shadow for depth
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize
                                                .min, // Ensures the modal only takes as much space as needed
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Birth Certificate",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.close,
                                                        color: Colors.grey),
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                "Lorem Ipsum is simply dummy text of "
                                                "the printing and typesetting industry "
                                                "Lorem Ipsum has been the industry's "
                                                "standard dummy text ever since the 1500s, "
                                                "when an unknown printer took a galley of "
                                                "type and scrambled it to make. a type "
                                                "specimen book. It has survived not only "
                                                "five centuries, but also the leap into "
                                                "electronic typesetting, remaining essentially unchanged.",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                  height:
                                                      1.5, // Line height for better readability
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Center(
                                                child: TextButton(
                                                  onPressed: onUpload,
                                                  child: Text(
                                                    "UPLOAD",
                                                    style: TextStyle(
                                                      color: AppColors.accentColor,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.info_outline,
                                    color: Colors.orange,
                                  ))),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                _buildStatusWidget(),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              dObj["details"] as String? ?? "No details available",
              style: TextStyle(
                color: AppColors.darkNavy,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusWidget() {
    switch (Status) {
      case DocumentStatus.upload:
        return TextButton(
          onPressed: onUpload,
          child: Text(
            "UPLOAD",
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case DocumentStatus.uploading:
        return SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            value: 0.3,
            color: AppColors.accentColor,
            strokeWidth: 2.0,
          ),
        );
      case DocumentStatus.uploaded:
      default:
        return Row(
          children: [
            Icon(Icons.check, color: AppColors.accentColor, size: 20),
            const SizedBox(width: 8),
            InkWell(
              onTap: onAction,
              child: Icon(Icons.more_vert, size: 20),
            ),
          ],
        );
    }
  }
}
