import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hnotes/style/style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppStyle.cardsColor[doc['color_id']],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            doc["note_title"],
            style: AppStyle.mainTitle,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            doc["creation_date"],
            style: AppStyle.subTitle,
          ),
          SizedBox(height: 8),
          Text(doc["note_content"],
              style: AppStyle.mainContent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ])),
  );
}
