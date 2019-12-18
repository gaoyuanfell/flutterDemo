import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('布局demo'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576576631000&di=020a510bc05f68821361684093d2a345&imgtype=0&src=http%3A%2F%2Fp2.qhimgs4.com%2Ft01ef067ae14845a9ef.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 240.0,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text('刘亦菲'),
                      ),
                      Text(
                        '刘亦菲，1987年8月25日出生于湖北省武汉市，华语影视女演员、歌手，毕业于北京电影学院2002级表演系本科班',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                ),
                FavoriteWidget(),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButtonColumn(Icons.call, 'CALL'),
                buildButtonColumn(Icons.near_me, 'ROUTE'),
                buildButtonColumn(Icons.share, 'SHARE'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Text(
              '《仙剑奇侠传》是根据大宇资讯同名单机游戏改编的古装仙侠玄幻电视剧，由上海唐人电影制作有限公司、云南电视台、上海影视有限公司等联合出品，李国立执导，胡歌、刘亦菲、安以轩、刘品言、彭于晏等联袂主演。该剧讲述了渔村的店小二李逍遥与女娲后人赵灵儿以及林家堡大小姐林月如等人之间的恩爱情仇，并联手消灭拜月教拯救苍生的故事。该剧于2005年1月24日在台湾中视首播，后于2005年1月31日在重庆电视台影视频道、上海电视台电视剧频道内地首播，又于2008年1月27日在河北卫视首轮上星播出。',
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  int _favoriteCount = 100000;
  bool _isFavorited = true;

  void toggleFavorite() {
    setState(() {
      // if(_isFavorited){
      // _isFavorited = false;
      _favoriteCount -= 1;
      // }else{
      // _isFavorited = true;
      // _favoriteCount += 1;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Icon(
              _isFavorited ? Icons.star : Icons.star_border,
              color: Colors.red[500],
            ),
            onPressed: toggleFavorite,
          ),
        ),
        Text(
          '$_favoriteCount',
          textAlign: TextAlign.right,
        ),
        SizedBox(
          width: 20,
          child: Text(
            '$_favoriteCount',
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
