=begin
#Flagr

#Flagr is a feature flagging, A/B testing and dynamic configuration microservice

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require "uri"

module Flagr
  class SegmentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # 
    # 
    # @param flag_id numeric ID of the flag to get
    # @param body create a segment under a flag
    # @param [Hash] opts the optional parameters
    # @return [Segment]
    def create_segment(flag_id, body, opts = {})
      data, _status_code, _headers = create_segment_with_http_info(flag_id, body, opts)
      return data
    end

    # 
    # 
    # @param flag_id numeric ID of the flag to get
    # @param body create a segment under a flag
    # @param [Hash] opts the optional parameters
    # @return [Array<(Segment, Fixnum, Hash)>] Segment data, response status code and response headers
    def create_segment_with_http_info(flag_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SegmentApi.create_segment ..."
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling SegmentApi.create_segment"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling SegmentApi.create_segment, must be greater than or equal to 1.'
      end

      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling SegmentApi.create_segment"
      end
      # resource path
      local_var_path = "/flags/{flagID}/segments".sub('{' + 'flagID' + '}', flag_id.to_s)

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
        :return_type => 'Segment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentApi#create_segment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 
    # 
    # @param flag_id numeric ID of the flag
    # @param segment_id numeric ID of the segment
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_segment(flag_id, segment_id, opts = {})
      delete_segment_with_http_info(flag_id, segment_id, opts)
      return nil
    end

    # 
    # 
    # @param flag_id numeric ID of the flag
    # @param segment_id numeric ID of the segment
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_segment_with_http_info(flag_id, segment_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SegmentApi.delete_segment ..."
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling SegmentApi.delete_segment"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling SegmentApi.delete_segment, must be greater than or equal to 1.'
      end

      # verify the required parameter 'segment_id' is set
      if @api_client.config.client_side_validation && segment_id.nil?
        fail ArgumentError, "Missing the required parameter 'segment_id' when calling SegmentApi.delete_segment"
      end
      if @api_client.config.client_side_validation && segment_id < 1
        fail ArgumentError, 'invalid value for "segment_id" when calling SegmentApi.delete_segment, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/flags/{flagID}/segments/{segmentID}".sub('{' + 'flagID' + '}', flag_id.to_s).sub('{' + 'segmentID' + '}', segment_id.to_s)

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
        @api_client.config.logger.debug "API called: SegmentApi#delete_segment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 
    # 
    # @param flag_id numeric ID of the flag to get
    # @param [Hash] opts the optional parameters
    # @return [Array<Segment>]
    def find_segments(flag_id, opts = {})
      data, _status_code, _headers = find_segments_with_http_info(flag_id, opts)
      return data
    end

    # 
    # 
    # @param flag_id numeric ID of the flag to get
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<Segment>, Fixnum, Hash)>] Array<Segment> data, response status code and response headers
    def find_segments_with_http_info(flag_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SegmentApi.find_segments ..."
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling SegmentApi.find_segments"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling SegmentApi.find_segments, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/flags/{flagID}/segments".sub('{' + 'flagID' + '}', flag_id.to_s)

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
        :return_type => 'Array<Segment>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentApi#find_segments\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 
    # 
    # @param flag_id numeric ID of the flag
    # @param segment_id numeric ID of the segment
    # @param body update a segment
    # @param [Hash] opts the optional parameters
    # @return [Segment]
    def put_segment(flag_id, segment_id, body, opts = {})
      data, _status_code, _headers = put_segment_with_http_info(flag_id, segment_id, body, opts)
      return data
    end

    # 
    # 
    # @param flag_id numeric ID of the flag
    # @param segment_id numeric ID of the segment
    # @param body update a segment
    # @param [Hash] opts the optional parameters
    # @return [Array<(Segment, Fixnum, Hash)>] Segment data, response status code and response headers
    def put_segment_with_http_info(flag_id, segment_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SegmentApi.put_segment ..."
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling SegmentApi.put_segment"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling SegmentApi.put_segment, must be greater than or equal to 1.'
      end

      # verify the required parameter 'segment_id' is set
      if @api_client.config.client_side_validation && segment_id.nil?
        fail ArgumentError, "Missing the required parameter 'segment_id' when calling SegmentApi.put_segment"
      end
      if @api_client.config.client_side_validation && segment_id < 1
        fail ArgumentError, 'invalid value for "segment_id" when calling SegmentApi.put_segment, must be greater than or equal to 1.'
      end

      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling SegmentApi.put_segment"
      end
      # resource path
      local_var_path = "/flags/{flagID}/segments/{segmentID}".sub('{' + 'flagID' + '}', flag_id.to_s).sub('{' + 'segmentID' + '}', segment_id.to_s)

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
        :return_type => 'Segment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentApi#put_segment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 
    # 
    # @param flag_id numeric ID of the flag
    # @param body reorder segments
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def put_segments_reorder(flag_id, body, opts = {})
      put_segments_reorder_with_http_info(flag_id, body, opts)
      return nil
    end

    # 
    # 
    # @param flag_id numeric ID of the flag
    # @param body reorder segments
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def put_segments_reorder_with_http_info(flag_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SegmentApi.put_segments_reorder ..."
      end
      # verify the required parameter 'flag_id' is set
      if @api_client.config.client_side_validation && flag_id.nil?
        fail ArgumentError, "Missing the required parameter 'flag_id' when calling SegmentApi.put_segments_reorder"
      end
      if @api_client.config.client_side_validation && flag_id < 1
        fail ArgumentError, 'invalid value for "flag_id" when calling SegmentApi.put_segments_reorder, must be greater than or equal to 1.'
      end

      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling SegmentApi.put_segments_reorder"
      end
      # resource path
      local_var_path = "/flags/{flagID}/segments/reorder".sub('{' + 'flagID' + '}', flag_id.to_s)

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
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SegmentApi#put_segments_reorder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
