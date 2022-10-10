class CardSerializer < ActiveModel::Serializer
  attributes :id, :foreign_language, :primary_lang_txt, :foreign_lang_txt, :img_url, :created_by
end
