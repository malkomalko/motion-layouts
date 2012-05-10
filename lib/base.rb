module Layouts
  module Base
    def initialize(view)
      @view = view
    end

    def view
      @view
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def layout(view, controller)
        @instance = self.new(view)
        @controller = controller
        self.template
        @views
      end

      def controller
        @controller
      end

      def instance
        @instance
      end

      def method_missing(klass, *args, &block)
        build_layout_for(klass, *args, &block)
      end

      def build_layout_for(klass, *args, &block)
        begin
          layout = Layouts.const_get(klass)
          @views ||= []
          current_view = layout.alloc(self, klass, controller)
          @views.push(current_view)
        rescue NameError
          return
        end
        layout.new(self, current_view, controller, &block)
      end
    end
  end
end
