def fsf(*args)
  selector = sf(*args)
  selector_format = selector.starts_with?('.//') ? :xpath : :css

  page.find(selector_format, selector)
end

def idsf(*args)
  id_selector = sf(*args)
  id_selector.starts_with?('#') ? id_selector[1..-1] : id_selector
end

def sf(*args)
  string = args.shift

  case string
  # TODO: Make sure flash conforms to this.
  when /the flash(.*)/
    flash_type_class = $1.strip
    flash_type_class = flash_type_class.empty? ? '' : ".#{flash_type_class}"

    ".flash#{flash_type_class} p"
  end
end
