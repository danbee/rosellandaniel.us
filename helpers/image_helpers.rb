module ImageHelpers
  def each_with_next_prev(array, &block)
    [array.last, *array, array.first].each_cons(3, &block)
  end

  def image_slug(image)
    "#{parameterize(image.title)}-#{image.filename[/[0-9\-]+/]}"
  end

  def parameterize(string)
    Iconv.conv('ascii//ignore//translit', 'utf-8', string)
      .gsub(/(\W+)/, "-").downcase
  end

  def srcset(image, sizes)
    sizes.map { |size| srcset_entry(image, size) }.join(", ")
  end

  def srcset_entry(image, size)
    "#{image_path(image, resize_to: size)} #{size}w"
  end
end
