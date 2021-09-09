=begin
#Flagr

#Flagr is a feature flagging, A/B testing and dynamic configuration microservice. The base path for all the APIs is \"/api/v1\". 

OpenAPI spec version: 1.1.12

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.21

=end

require 'uri'

module Flagr
  class FlagApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # @param body create a flag
    # @param [Hash] opts the optional parameters
    # @return [Flag]
    def create_flag(body, opts = {})
      data, _status_code, _headers = create_flag_with_http_info(body, opts)
      data
    end

    # @param body create a flag
    # @param [Hash] opts the optional parameters
    # @return [Array<(Flag, Fixnum, Hash)>] Flag data, response status code and response headers
    def create_flag_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.create_flag ...'
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling FlagApi.create_flag"
      end
      # resource path
      local_var_path = '/flags'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Flag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#create_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # @param flag_id numeric ID of the flag
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_flag(flag_id, opts = {})
      delete_flag_with_http_info(flag_id, opts)
      nil
    end

    # @param flag_id numeric ID of the flag
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_flag_with_http_info(flag_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.delete_flag ...'
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling FlagApi.delete_flag"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling FlagApi.delete_flag, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/flags/{flagID}'.sub('{' + 'flagID' + '}', flag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#delete_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit the numbers of flags to return
    # @option opts [BOOLEAN] :enabled return flags having given enabled status
    # @option opts [String] :description return flags exactly matching given description
    # @option opts [String] :tags return flags with the given tags (comma separated)
    # @option opts [String] :description_like return flags partially matching given description
    # @option opts [String] :key return flags matching given key
    # @option opts [Integer] :offset return flags given the offset, it should usually set together with limit
    # @option opts [BOOLEAN] :preload return flags with preloaded segments and variants
    # @return [Array<Flag>]
    def find_flags(opts = {})
      data, _status_code, _headers = find_flags_with_http_info(opts)
      data
    end

    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit the numbers of flags to return
    # @option opts [BOOLEAN] :enabled return flags having given enabled status
    # @option opts [String] :description return flags exactly matching given description
    # @option opts [String] :tags return flags with the given tags (comma separated)
    # @option opts [String] :description_like return flags partially matching given description
    # @option opts [String] :key return flags matching given key
    # @option opts [Integer] :offset return flags given the offset, it should usually set together with limit
    # @option opts [BOOLEAN] :preload return flags with preloaded segments and variants
    # @return [Array<(Array<Flag>, Fixnum, Hash)>] Array<Flag> data, response status code and response headers
    def find_flags_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.find_flags ...'
      end
      # resource path
      local_var_path = '/flags'

      # query parameters
      query_params = {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'enabled'] = opts[:'enabled'] if !opts[:'enabled'].nil?
      query_params[:'description'] = opts[:'description'] if !opts[:'description'].nil?
      query_params[:'tags'] = opts[:'tags'] if !opts[:'tags'].nil?
      query_params[:'description_like'] = opts[:'description_like'] if !opts[:'description_like'].nil?
      query_params[:'key'] = opts[:'key'] if !opts[:'key'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'preload'] = opts[:'preload'] if !opts[:'preload'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<Flag>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#find_flags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # @param flag_id numeric ID of the flag to get
    # @param [Hash] opts the optional parameters
    # @return [Flag]
    def get_flag(flag_id, opts = {})
      data, _status_code, _headers = get_flag_with_http_info(flag_id, opts)
      data
    end

    # @param flag_id numeric ID of the flag to get
    # @param [Hash] opts the optional parameters
    # @return [Array<(Flag, Fixnum, Hash)>] Flag data, response status code and response headers
    def get_flag_with_http_info(flag_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.get_flag ...'
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling FlagApi.get_flag"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling FlagApi.get_flag, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/flags/{flagID}'.sub('{' + 'flagID' + '}', flag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Flag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#get_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # @param [Hash] opts the optional parameters
    # @return [Array<String>]
    def get_flag_entity_types(opts = {})
      data, _status_code, _headers = get_flag_entity_types_with_http_info(opts)
      data
    end

    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<String>, Fixnum, Hash)>] Array<String> data, response status code and response headers
    def get_flag_entity_types_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.get_flag_entity_types ...'
      end
      # resource path
      local_var_path = '/flags/entity_types'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<String>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#get_flag_entity_types\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # @param flag_id numeric ID of the flag to get
    # @param [Hash] opts the optional parameters
    # @return [Array<FlagSnapshot>]
    def get_flag_snapshots(flag_id, opts = {})
      data, _status_code, _headers = get_flag_snapshots_with_http_info(flag_id, opts)
      data
    end

    # @param flag_id numeric ID of the flag to get
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<FlagSnapshot>, Fixnum, Hash)>] Array<FlagSnapshot> data, response status code and response headers
    def get_flag_snapshots_with_http_info(flag_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.get_flag_snapshots ...'
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling FlagApi.get_flag_snapshots"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling FlagApi.get_flag_snapshots, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/flags/{flagID}/snapshots'.sub('{' + 'flagID' + '}', flag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<FlagSnapshot>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#get_flag_snapshots\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # @param flag_id numeric ID of the flag to get
    # @param body update a flag
    # @param [Hash] opts the optional parameters
    # @return [Flag]
    def put_flag(flag_id, body, opts = {})
      data, _status_code, _headers = put_flag_with_http_info(flag_id, body, opts)
      data
    end

    # @param flag_id numeric ID of the flag to get
    # @param body update a flag
    # @param [Hash] opts the optional parameters
    # @return [Array<(Flag, Fixnum, Hash)>] Flag data, response status code and response headers
    def put_flag_with_http_info(flag_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.put_flag ...'
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling FlagApi.put_flag"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling FlagApi.put_flag, must be greater than or equal to 1.'
      end

      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling FlagApi.put_flag"
      end
      # resource path
      local_var_path = '/flags/{flagID}'.sub('{' + 'flagID' + '}', flag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Flag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#put_flag\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # @param flag_id numeric ID of the flag to get
    # @param body set flag enabled state
    # @param [Hash] opts the optional parameters
    # @return [Flag]
    def set_flag_enabled(flag_id, body, opts = {})
      data, _status_code, _headers = set_flag_enabled_with_http_info(flag_id, body, opts)
      data
    end

    # @param flag_id numeric ID of the flag to get
    # @param body set flag enabled state
    # @param [Hash] opts the optional parameters
    # @return [Array<(Flag, Fixnum, Hash)>] Flag data, response status code and response headers
    def set_flag_enabled_with_http_info(flag_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FlagApi.set_flag_enabled ...'
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling FlagApi.set_flag_enabled"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling FlagApi.set_flag_enabled, must be greater than or equal to 1.'
      end

      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling FlagApi.set_flag_enabled"
      end
      # resource path
      local_var_path = '/flags/{flagID}/enabled'.sub('{' + 'flagID' + '}', flag_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Flag')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FlagApi#set_flag_enabled\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
