class AntipodesFacade < LocationFacade

  def get_antipodes
    service.find_antipodes(get_location)
  end

  def service
    @amypode_service ||= AmypodeService.new
  end

end
