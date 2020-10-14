module ApplicationHelper
    # ページごとの完全なタイトルを返します。
    def full_title(page_title = '')
        base_title = "りもーとレッスン♪"
        if page_title.empty?
        base_title
        else
        base_title + " | " + page_title
        end
    end

    def converting_to_jpy(price)

        if price.nil? then
            "未設定"
        else
            "#{price.to_s(:delimited, delimiter: ',')}円"
        end
    end
    
end
