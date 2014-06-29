class SearchController < ApplicationController
    def index

        # ぐるなびから情報を取得
        @cafes = GurunabiCafe.get_cafes

        # ホットペッパーから情報を取得

        # ぐるなびから情報を取得

        pp @cafes
    end
end
