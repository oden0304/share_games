# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline

# タグ
Tag.create([
    { name: 'RPG' },
    { name: 'シューティング' },
    { name: 'アクション'},
    { name: 'アドベンチャー'},
    { name: 'シミュレーション'},
    { name: 'スポーツ'},
    { name: 'レーシング'},
    { name: '音ゲー'},
    { name: 'その他'},
    ])

#管理者用ログイン情報
Admin.create!(
    email: 'admin@admin.com',
    password: '123456',
)

# # ユーザーテストデータ
User.create!(
[
    {agreement: true, name: '長浜杏桜', password: 'password', introduction: 'FPS、RPGが好きです！よろしくお願いします！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {agreement: true, name: '岩永秀実', password: 'password', introduction: 'よろしくお願いします。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {agreement: true, name: '坂本寧音', password: 'password', introduction: 'ゲーム配信やってます！遊びにきてね！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {agreement: true, name: '高井幸子', password: 'password', introduction: 'アラサーのゲーム大好き社会人です。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {agreement: true, name: '田辺満喜子', password: 'password', introduction: '気軽にフォローしてください！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {agreement: true, name: '大西香乃', password: 'password', introduction: 'アクション、レトロゲームを中心に動画配信してます！見にきてね！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {agreement: true, name: '大槻羽菜', password: 'password', introduction: '暇人です。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {agreement: true, name: '吉井貞雄', password: 'password', introduction: 'ShareGames始めたてです。よろしく。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")},
    {agreement: true, name: '岩瀬宏次', password: 'password', introduction: '好きなゲームの攻略つぶやいてます', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")},
    {agreement: true, name: '岩瀬奏', password: 'password', introduction: '無言フォロー失礼します！！マリオ好きな方情報共有しましょう！！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")},
    {agreement: true, name: '阿久津夏弥乃', password: 'password', introduction: '普段はゲーム作ってます。よろしくどーぞ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")},
    {agreement: true, name: '畠山麗', password: 'password', introduction: '趣味はYouTube見ること、ゲームすることです。最近はFPSにハマってます！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg")},
    {agreement: true, name: '志賀千穂', password: 'password', introduction: '学生です。暇さえあればゲームしてます。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename:"sample-user13.jpg")},
    {agreement: true, name: '松木香菜', password: 'password', introduction: 'いきなり絡みに行くかもしれませんが仲良くしてください！フォロー大歓迎！！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.jpg"), filename:"sample-user14.jpg")},
    {agreement: true, name: '岡田好夫', password: 'password', introduction: '生まれたその日から、ゲームを愛しています。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename:"sample-user15.jpg")},
    {agreement: true, name: '嶋田結花', password: 'password', introduction: 'ゲームって素晴らしい！！！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user16.jpg"), filename:"sample-user16.jpg")},
    {agreement: true, name: '本郷敏之', password: 'password', introduction: 'ゲーム実況しています！ぜひ見に来てください！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user17.jpg"), filename:"sample-user17.jpg")},
    {agreement: true, name: '迫田陽一', password: 'password', introduction: 'プロゲーマー目指してます。Battleshooter部門sniper所属。応援してくれる方フォローよろしくお願いします。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user18.jpg"), filename:"sample-user18.jpg")},
    {agreement: true, name: '進藤仁', password: 'password', introduction: 'ゲームとアニメが好きです', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user19.jpg"), filename:"sample-user19.jpg")},
    {agreement: true, name: '谷村穂乃香', password: 'password', introduction: 'ゲームが生きがいです。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user20.jpg"), filename:"sample-user20.jpg")}
]
)

# 投稿テストデータ
Post.create!(
[
    {text: 'ShareGames始めました。フォローよろしくお願いします！', user_id: 1, tag_ids: 9 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.png"), filename:"sample-post1.png"),text: '今日からBattle shooterやっていきます！', user_id: 1, tag_ids: 2 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.png"), filename:"sample-post2.png"),text: 'お城につきました！', user_id: 2, tag_ids: 1 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.png"), filename:"sample-post3.png"),text: '酒場で仲間探ししよ', user_id: 3, tag_ids: 1 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.png"), filename:"sample-post4.png"),text: '初めて仲間になるモンスターは何かな？', user_id: 4, tag_ids: 1 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.png"), filename:"sample-post5.png"),text: 'ラストダンジョン、クリアです！！嬉しい！！', user_id: 5, tag_ids: 1 },
    {text: 'なんかゲームしたい', user_id: 6, tag_ids: 9 },
    {text: 'Battleshooterのアプデ来たらしいぞ', user_id: 6, tag_ids: 2 },
    {text: 'マイクラ配信します！', user_id: 7, tag_ids: 9 },
    {text: '最近はAPEXが流行ってるらしいです', user_id: 8, tag_ids: 9 },
    {text: 'ブレワイの続編出ないかな〜', user_id: 9, tag_ids: 3 },
    {text: 'ゲーム最高！！！', user_id: 10, tag_ids: 9 },
    {text: '明日FAINALSTORY発売日じゃん。。。', user_id: 11, tag_ids: 1 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.png"), filename:"sample-post6.png"),text: 'やっとできる〜！！', user_id: 11, tag_ids: 1 },
    {text: '楽しい！', user_id: 11, tag_ids: 1 },
    {text: '初めまして', user_id: 12, tag_ids: 9 },
    {text: '好きなジャンルはFPSです。', user_id: 13, tag_ids: 2 },
    {text: '今日FAINALSTORY買いに行くー', user_id: 14, tag_ids: 1 },
    {text: '売り切れてた', user_id: 14, tag_ids: 1 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.png"), filename:"sample-post7.png"),text: 'プログラミングもゲームで学べる時代か...', user_id: 15, tag_ids: 9 },
    {text: '買ってしまった', user_id: 15, tag_ids: 9 },
    {text: '普通に面白い', user_id: 15, tag_ids: 9 },
    {text: 'ニンテンドーの公式にフォローされたぞ。。。？', user_id: 16, tag_ids: 9 },
    {text: '誰か今度ウイイレやりましょう〜', user_id: 17, tag_ids: 6 },
    {text: 'エペできる人募集＠３', user_id: 18, tag_ids: 2 },
    {post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.png"), filename:"sample-post8.png"),text: 'バトミントンやりたい', user_id: 19, tag_ids: 6 },
    {text: 'マリオ新作出るらしいよ', user_id: 20, tag_ids: 3 },
    {text: '嘘だったみたい', user_id: 20, tag_ids: 3 },
    {text: 'でもそろそろ出てもいいよな新作', user_id: 20, tag_ids: 3 }
]
)