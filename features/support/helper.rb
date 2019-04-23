# encoding: utf-8
# !/usr/bin/env ruby
require 'fileutils'
# metodo para tira screenshot e imbutir no relatorio html
module Helper
  def tira_foto(file_name, resultado)
    data = Time.now.strftime('%F').to_s
    h_m_s = Time.now.strftime('%H%M%S%p').to_s
    caminho = "results/evidencias/test_#{resultado}/#{data}"
    foto = "#{caminho}/#{h_m_s}.png"
    page.save_screenshot(foto, full: true)
    embed(foto, 'image/png', 'Ver_Evidencia')
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
