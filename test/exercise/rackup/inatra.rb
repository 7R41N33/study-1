module Inatra
  class << self
    def routes(&block)
      @routes ||= []
      instance_eval(&block)
    end

    def call(env)
      route = fetch_route(env['REQUEST_METHOD'], env['PATH_INFO'])

      return [404, {}, ['Not found']] if route.nil?

      route[:block].call
    end

    def get(path, &block)
      @routes << { method: 'get', path: path, block: block }
    end

    def fetch_route(method, path)
      @routes.select { |r| r[:method] == method.downcase && r[:path] == path }.last
    end
  end
end
