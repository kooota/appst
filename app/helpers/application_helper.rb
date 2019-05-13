module ApplicationHelper

  def get_twitter_card_info(post)
    twitter_card = {}
    if post
      twitter_card[:url] = request.url
      twitter_card[:title] = post.title
      twitter_card[:description] = post.content
      twitter_card[:image] = post.image
    else
      twitter_card[:url] = 'https://appstimes.jp'
      twitter_card[:title] = 'AppsTimes'
      twitter_card[:description] = '最新・人気のWEBサービス・プロダクトが集まるメディア'
      twitter_card[:image] = '/public/uploads/post/image/14/appstimes.jpg'
    end
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:site] = '@AppsTimes'
    twitter_card
  end

require "uri"
  def text_url_to_link text
    URI.extract(text, ['http', 'https']).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

      text.gsub!(url, sub_text)
    end

    return text
  end

end
