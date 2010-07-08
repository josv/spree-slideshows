module SlideshowsHelper

  def insert_slideshow(params={})
    @content_for_head_added ||= false
    if not @content_for_head_added
      content_for(:head) { stylesheet_link_tag 'slideshow.css' }
      content_for(:head) { javascript_include_tag 'jquery.cycle.lite.min.js' }
      content_for(:head) do 
        %{ <script type="text/javascript">
          $(document).ready(function() {
            $('.slideshow').cycle({
	 	fx: 'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
                timeout: 5000
	    });
          });
        </script> }
      end
      @content_for_head_added = true
    end
    content_tag :div, slide_images(params), :class => "slideshow"
  end

  def slide_images(params)
      max = params[:max]||5
      group = params[:group]||""
      slides = Slide.included.localized(I18n.locale.to_s).in_group(group)
      extra_slides = Slide.not_included.localized(I18n.locale.to_s).in_group(group).sort_by { rand }.slice(0...max-slides.count)
      slides = (slides + extra_slides).sort_by { |slide| slide.position }
      
      slides.map do |slide|
        link_to(image_tag(slide.img.url), slide.url, { :title => slide.name })
      end.join
  end

end
