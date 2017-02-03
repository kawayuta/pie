class Get < ApplicationRecord
 acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  records_with_operator_on :create, :update, :destroy
    validates :title,
    presence: true,
    length: { :maximum => 20}
    validates :getimage,
    presence: true
    validates :price,
    presence: true,
    length: { :maximum => 8}
    validates :body,
    presence: true,
    length: { :maximum => 300}

  acts_as_votable
  
   has_many :attachments, dependent: :destroy

   	SELECT_BRAND_OPTION = [
    ['A', [
        ['ASOS',   'ASOS'],
        ['adidas', 'adidas'],
        ['Anthropologie',    'Anthropologie'],
        ['Abercrombie & Fitch',   'Abercrombie & Fitch']
      ]
    ],
    ['B', [
      ]
    ],
    ['C', [
      ]
    ],
    ['D', [
      ]
    ]
  ]
  
  SELECT_CATEGORY_OPTION = [
    ['トップス', [
        ['Tシャツ・カットソー',   'Tシャツ・カットソー_fashion'],
        ['ブラウス・シャツ', 'ブラウス・シャツ_fashion'],
        ['ニット・セーター',    'ニット・セーター_fashion'],
        ['スウェット・トレーナー',   'スウェット・トレーナー_fashion']
      ]
    ],
    ['ボトムス', [
      ]
    ],
    ['アウター', [
    	['ジャケット', 'ジャケット_fashion']
      ]
    ],
    ['靴・シューズ・ブーツ', [
      ]
    ],
    ['バッグ・カバン', [
      ]
    ],
    ['財布・カードケース・スマホケース', [
      ]
    ],
    ['アクセサリー', [
      ]
    ],
    ['腕時計', [
      ]
    ],
    ['その他', [
      ]
    ],
      ]

 	mount_uploader :getimage, GetimageUploader
end
