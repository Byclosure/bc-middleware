require "bc-middleware/base"

module BcMiddleware
  module SearchApi
    def collection
	    get_collection_ivar || begin
	      c = end_of_association_chain

	      if respond_to?(:search_terms) && (terms = search_terms).present?
          c = c.search(terms)
        end

        if respond_to?(:page_term) && page_term.present? && respond_to?(:per_term) && per_term.present?
          if c.respond_to?(:scoped)
            c = c.search.page(page_term).per(per_term)
          else
            c = c.page(page_term).per(per_term)
          end
        end

	      set_collection_ivar(c.respond_to?(:scoped) ? c.scoped : c.all)
	    end
	  end

	  def search_terms
	    params[:search]
    end

    def page_term
      params[:paginate][:page]
    end

    def per_term
      params[:paginate][:per]
    end

	  def attribute_fields
	    params[:fields].present? ? params[:fields] : resource_class_attributes
	  end

	  def relationship_fields
	    @relationship_fields ||= begin
	      include_params = params[:include].present? ? params[:include] : {}
	      raise(ArgumentError.new("wrong format for include parameter")) unless include_params.is_a?(Hash)
	      
	      result = {}
	      include_params.each do |(relationship_name, relationship_value)|
	        # TODO verificar as relacoes
	        if relationship_value.present?
	          result[relationship_name] = relationship_value
	        else
	          relationship = resource_class.reflect_on_all_associations.detect {|r| r.name == relationship_name.to_sym}
	          if relationship.nil?
	          	raise(InvalidRelationship.new("Relationship with name #{relationship_name} not found for #{resource_class}"))
	          end
	          result[relationship_name] = extract_attributes(relationship.klass)
	        end
	      end

	      result
	    end
	  end

	  def resource_class_attributes
	    @resource_class_attributes ||= extract_attributes(resource_class)
	  end

	  def extract_attributes(klass)
	    klass.accessible_attributes.select(&:present?) + [klass.primary_key]
	  end
  end
end