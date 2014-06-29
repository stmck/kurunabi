class GurunabiCafe

    require "nokogiri"

    GURUNABI_API_DOMAIN = "http://api.gnavi.co.jp/ver1"
    SEARCH_CAFES_URL = "RestSearchAPI/?"
    API_KEY = "e9f9a32d1569937d03eada4e41bb5018"

    def self.get_cafes

        conn = Faraday::Connection.new(:url => GURUNABI_API_DOMAIN) do |builder|
            builder.use Faraday::Request::UrlEncoded  # リクエストパラメータを URL エンコードする
            builder.use Faraday::Response::Logger     # リクエストを標準出力に出力する
            builder.use Faraday::Adapter::NetHttp     # Net/HTTP をアダプターに使う
        end

        response = conn.get do |req|  # GET http://example.com/api/nyan.json?color=white&size=big
            req.url SEARCH_CAFES_URL
            req.params[:keyid] = API_KEY
            req.params[:freeword] = "新宿, 車いすで入店可"
        end

        xml_doc = Nokogiri::XML response.body

        cafes = []
            pp "-"*100
        pp xml_doc.xpath("//rest").size
        xml_doc.xpath("//rest").each do |rest|
            cafe = {}
            cafe["name"] = rest.xpath("name").text
            cafe["address"] = rest.xpath("address").text
            cafe["tel"] = rest.xpath("tel").text
            cafe["opentime"] = rest.xpath("opentime").text
            cafe["name"] = rest.xpath("name").text
            cafe["image_url"] = rest.xpath("image_url").xpath("shop_image1").text
            cafes << cafe
        end
        cafes
    end
end
