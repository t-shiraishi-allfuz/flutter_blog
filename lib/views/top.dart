import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TopView extends StatefulWidget {
	const TopView({super.key});

	@override
	State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
	// 仮データ
	String header_image = "assets/images/header.png";

	// 仮データ
	final Map<String, String> profiles = {
		'icon': 'assets/images/icon2.jpeg',
		'name': 'ニックネーム',
		'content': 'プロフィール紹介文'
	};

	// 仮データ
	final List<Map<String, String>> blogPosts = [
		{'title': 'ブログタイトル1', 'image': 'assets/images/sample.jpg', 'content': '説明文1', 'created_at': '投稿日時'},
		{'title': 'ブログタイトル2', 'image': 'assets/images/sample2.jpg', 'content': '説明文2', 'created_at': '投稿日時'},
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: PreferredSize(
				preferredSize: Size.fromHeight(100.0),
				child: AppBar(
					title: const Text("マイページ"),
					centerTitle: true,
					flexibleSpace: Container(
						decoration: BoxDecoration(
							image: DecorationImage(
								image: AssetImage(header_image),
								fit: BoxFit.cover
							),
						),
					),
					toolbarHeight: 100,
				),
			),
			body: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						width: 250.0,
						child: ProfileWidget(profiles: profiles),
					),
					Expanded(
						child: BlogPostList(blogPosts: blogPosts),
					),
					Container(
						width: 300.0,
						child: CalendarAndDropdownWidget(),
					),
				],
			),
		);
	}
}

// プロフィール
class ProfileWidget extends StatelessWidget {
	final Map<String, String> profiles;

	ProfileWidget({required this.profiles});

	@override
	Widget build(BuildContext context) {
		return Container(
			margin: EdgeInsets.all(10.0),
			padding: EdgeInsets.all(10.0),
			height: 250.0,
			decoration: BoxDecoration(
				border: Border.all(color: Colors.grey),
				borderRadius: BorderRadius.circular(5),
			),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					CircleAvatar(
						radius: 25.0,
						backgroundImage: AssetImage(profiles["icon"]!),
					),
					SizedBox(height: 16.0),
					Text(
						profiles["name"]!,
						style: TextStyle(
							fontSize: 12.0,
							fontWeight: FontWeight.bold,
						),
					),
					SizedBox(height: 8.0),
					Text(
						profiles["content"]!,
						style: TextStyle(
							fontSize: 10.0,
						),
					),
				],
			),
		);
	}
}

// ブログリスト
class BlogPostList extends StatelessWidget {
	final List<Map<String, String>> blogPosts;

	BlogPostList({required this.blogPosts});

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: blogPosts.length,
			itemBuilder: (context, index) {
				return BlogPostCard(
					title: blogPosts[index]['title']!,
					image: blogPosts[index]['image']!,
					content: blogPosts[index]['content']!,
					createdAt: blogPosts[index]['created_at']!,
				);
			},
		);
	}
}

// 記事カード
class BlogPostCard extends StatelessWidget {
	final String title;
	final String image;
	final String content;
	final String createdAt;

	BlogPostCard({
		required this.title,
		required this.image,
		required this.content,
		required this.createdAt,
	});

	@override
	Widget build(BuildContext context) {
		return Card(
			margin: EdgeInsets.all(8.0),
			child: Padding(
				padding: EdgeInsets.all(16.0),
				child: Row(
					children: [
						Container(
							child: Image.asset(
								image,
								width: 150.0,
								height: 150.0,
								fit: BoxFit.cover,
							),
						),
						SizedBox(width: 8.0),
						Expanded(
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Text(
										title,
										style: TextStyle(
											fontSize: 18.0,
											fontWeight: FontWeight.bold,
										),
									),
									SizedBox(height: 8.0),
									Text(
										content,
										style: TextStyle(fontSize: 14.0),
									),
									SizedBox(height: 8.0),
									Row(
										children: [
											const Spacer(),
											Text(
												createdAt,
												style: TextStyle(fontSize: 10.0),
											),
										],
									),
								],
							),
						),
					],
				),
			),
		);
	}
}

// カレンダー
class CalendarAndDropdownWidget extends StatelessWidget {
	DateTime _focusedDay = DateTime.now();
	CalendarFormat _calendarFormat = CalendarFormat.month;

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.all(16.0),
			child: Column(
				children: [
					SizedBox(
						width: 250.0,
						height: 250.0,
						child: TableCalendar(
							firstDay: DateTime.utc(2024, 1, 1),
							lastDay: DateTime.utc(2024, 12, 31),
							focusedDay: _focusedDay,
							calendarFormat: _calendarFormat,
							shouldFillViewport: true,
							locale: 'ja_JP',
							headerStyle: HeaderStyle(
								formatButtonVisible: false,
								titleCentered: true,
							),
						),
					),
					SizedBox(height: 16.0),
					Text(
						"カテゴリー選択",
						style: TextStyle(
							fontSize: 16.0,
							fontWeight: FontWeight.bold,
						),
					),
					DropdownButton<String>(
						hint: Text('全て'),
						value: '全て',
						items: ['全て', 'カテゴリー1', 'カテゴリー2', 'カテゴリー3']
							.map((category) => DropdownMenuItem<String>(
								value: category,
								child: Text(category),
							)).toList(),
						onChanged: (String? newValue) {
						},
					),
				],
			),
		);
	}
}

