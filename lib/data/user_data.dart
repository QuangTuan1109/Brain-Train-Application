import 'package:flutter_application_1/models/user.dart';

final allUser = <User>[
  User(
    id: 1,
    name: 'Nguyen Quoc Bao',
    dob: '27/3/2001',
    sdt: '0909090909',
    email: 'bao@gmail.com',
    score_Languages1: '2000',
    list_Languages1:
        'sáng, sang, suy, sánh, sao, sút, sáng, sang, suy, sánh, sao, sút',
    score_Languages2: '1200',
    list_Languages2: 'giao tiếp, giao hiệp, giao lưu, giao thông',
    score_Languages3: '1200',
    list_Languages3: 'giao, tiếp, nhận, hàng, hoá, chất',
    level_Languages4: '5',

    //
    level_Memory1: '8',
    score_Memory1: '1200',
    level_Memory2: '8',
    score_Memory2: '1200',
    level_Memory3: '18',
    score_Memory3: '1200',
    //

    score_Math1: '2000',
    level_Math1: '12',
    score_Math2: '1200',
    level_Math2: '2',
    //
    score_Attention1: '1600',
    level_Attention1: '22',
    score_Attention2: '900',
    level_Attention2: '1',
    score_Attention3: '2900',
    level_Attention3: '14',
    urlImage:
        'https://images.unsplash.com/photo-1615347497551-277d6616b959?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=692&q=80',
  ),
  User(
    id: 2,
    name: 'Lerone Pieters',
    dob: '10/01/2002',
    sdt: '0909090909',
    email: 'adb@gmail.com',
    score_Languages1: '1200',
    list_Languages1: 'tối, thao, tắt, thiên, thú, theo',
    score_Languages2: '1200',
    list_Languages2: 'trung tâm, trung thành, trung nghĩa',
    score_Languages3: '1200',
    list_Languages3: 'trung, tâm, trạng, nguyên, nhân, quả',
    level_Languages4: '2',
    level_Memory1: '8',
    score_Memory1: '1200',
    level_Memory2: '8',
    score_Memory2: '1200',
    level_Memory3: '11',
    score_Memory3: '1200',
    //

    score_Math1: '2000',
    level_Math1: '12',
    score_Math2: '1200',
    level_Math2: '2',
    //
    score_Attention1: '1600',
    level_Attention1: '22',
    score_Attention2: '900',
    level_Attention2: '1',
    score_Attention3: '2900',
    level_Attention3: '14',
    urlImage:
        'https://images.unsplash.com/photo-1615346340977-cf7f5a8f3059?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  // Book(
  //   id: 3,
  //   author: 'Uliana Kopanytsia',
  //   title: 'Sweets and Cakes',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615351897596-d3a9fffb5797?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=665&q=80',
  // ),
  // Book(
  //   id: 4,
  //   author: 'Riccardo Andolfo',
  //   title: 'Vast Deserts',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615333619365-a44d7e655661?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80',
  // ),
  // Book(
  //   id: 5,
  //   author: 'Miguel Arguibide',
  //   title: 'Parkour',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615286505008-cbca9896192f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=962&q=80',
  // ),
  // Book(
  //   id: 6,
  //   author: 'Tran Mau Tri Tam',
  //   title: 'Cute Kitties',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615369794017-f65e6f0c0393?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  // ),
  // Book(
  //   id: 7,
  //   author: 'Josh Hemsley',
  //   title: 'Beahces',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615357633073-a7b67638dedb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80',
  // ),
  // Book(
  //   id: 8,
  //   author: 'Carlos Mesa',
  //   title: 'Tides',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615185054269-363482a365ad?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=809&q=80',
  // ),
  // Book(
  //   id: 9,
  //   author: 'Kellen Riggin',
  //   title: 'Magnificent Forests',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615331224984-281512856592?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  // ),
  // Book(
  //     id: 10,
  //     author: 'Navi Photography',
  //     title: 'Butterflies',
  //     urlImage:
  //         'https://images.unsplash.com/photo-1615300236079-4bdb43bd9a9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80'),
  // Book(
  //   id: 11,
  //   author: 'Kellen Riggin',
  //   title: 'Magnificent Forests',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615331224984-281512856592?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  // ),
  // Book(
  //   id: 12,
  //   author: 'Kellen Riggin',
  //   title: 'Magnificent Forests',
  //   urlImage:
  //       'https://images.unsplash.com/photo-1615331224984-281512856592?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  // ),
];
