class Present < ApplicationRecord
    validates :price,
    presence: true
    validates :image,
    presence: true
    validates :youage,
    presence: true

    
  acts_as_votable

  records_with_operator_on :create, :update


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

      SELECT_MANWOMAN_OPTION = [
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
 mount_uploader :image, ImageUploader
end
