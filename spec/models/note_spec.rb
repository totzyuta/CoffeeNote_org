require 'rails_helper'

describe Note do
  # ノートに必要なatributesがあれば有効な状態であること
  it "is valid with all attributes of note"
  # ブレンド名がなければ無効な状態であること
  it "is invalid without a blendName"
  # 総合評価がなければ無効な状態であること
  it "is invalid without overall"
  # ブレンド名を返すこと
  it "returns a blendName"
  # 画像の参照先を返すこと
  it "returns a path to coffee image"
end
