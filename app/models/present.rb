class Present < ApplicationRecord

 acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
                   
                   
  records_with_operator_on :create, :update
    validates :price,
    presence: true
    validates :image,
    presence: true
    validates :enquete, :presence => true, :length => { :maximum => 300}
    
  acts_as_votable
  
  acts_as_commentable

  has_many :polls



  SELECT_GENDER_OPTION = [
    ['性別', [
        ['MAN',   'MAN'],
        ['WOMAN', 'WOMAN']
      ]
    ]
  ]

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
        ['Tシャツ・カットソー',   'Tシャツ・カットソー'],
        ['ブラウス・シャツ', 'ブラウス・シャツ'],
        ['ニット・セーター',    'ニット・セーター'],
        ['スウェット・トレーナー',   'スウェット・トレーナー']
      ]
    ],
    ['ボトムス', [
      ]
    ],
    ['アウター', [
    	['ジャケット', 'ジャケット']
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

 mount_uploader :image, ImageUploader
end
