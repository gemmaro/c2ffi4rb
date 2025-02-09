# frozen_string_literal: true

require 'ffi'

module MY_CAIRO
  extend FFI::Library
  ffi_lib 'cairo'

  attach_function 'cairo_version', [], :int

  attach_function 'cairo_version_string', [], :string

  typedef :int, :cairo_bool_t

  class C_Cairo < FFI::Union
  end

  Cairo_T = C_Cairo

  class C_Cairo_Surface < FFI::Union
  end

  Cairo_Surface_T = C_Cairo_Surface

  class C_Cairo_Device < FFI::Union
  end

  Cairo_Device_T = C_Cairo_Device

  class C_Cairo_Matrix < FFI::Union
    layout \
      :xx, :double,
      :yx, :double,
      :xy, :double,
      :yy, :double,
      :x0, :double,
      :y0, :double
  end

  Cairo_Matrix_T = C_Cairo_Matrix

  class C_Cairo_Pattern < FFI::Union
  end

  Cairo_Pattern_T = C_Cairo_Pattern

  typedef :pointer, :cairo_destroy_func_t

  class C_Cairo_User_Data_Key < FFI::Union
    layout \
      :unused, :int
  end

  Cairo_User_Data_Key_T = C_Cairo_User_Data_Key

  enum :_cairo_status, [
    :CAIRO_STATUS_SUCCESS, 0,
    :CAIRO_STATUS_NO_MEMORY, 1,
    :CAIRO_STATUS_INVALID_RESTORE, 2,
    :CAIRO_STATUS_INVALID_POP_GROUP, 3,
    :CAIRO_STATUS_NO_CURRENT_POINT, 4,
    :CAIRO_STATUS_INVALID_MATRIX, 5,
    :CAIRO_STATUS_INVALID_STATUS, 6,
    :CAIRO_STATUS_NULL_POINTER, 7,
    :CAIRO_STATUS_INVALID_STRING, 8,
    :CAIRO_STATUS_INVALID_PATH_DATA, 9,
    :CAIRO_STATUS_READ_ERROR, 10,
    :CAIRO_STATUS_WRITE_ERROR, 11,
    :CAIRO_STATUS_SURFACE_FINISHED, 12,
    :CAIRO_STATUS_SURFACE_TYPE_MISMATCH, 13,
    :CAIRO_STATUS_PATTERN_TYPE_MISMATCH, 14,
    :CAIRO_STATUS_INVALID_CONTENT, 15,
    :CAIRO_STATUS_INVALID_FORMAT, 16,
    :CAIRO_STATUS_INVALID_VISUAL, 17,
    :CAIRO_STATUS_FILE_NOT_FOUND, 18,
    :CAIRO_STATUS_INVALID_DASH, 19,
    :CAIRO_STATUS_INVALID_DSC_COMMENT, 20,
    :CAIRO_STATUS_INVALID_INDEX, 21,
    :CAIRO_STATUS_CLIP_NOT_REPRESENTABLE, 22,
    :CAIRO_STATUS_TEMP_FILE_ERROR, 23,
    :CAIRO_STATUS_INVALID_STRIDE, 24,
    :CAIRO_STATUS_FONT_TYPE_MISMATCH, 25,
    :CAIRO_STATUS_USER_FONT_IMMUTABLE, 26,
    :CAIRO_STATUS_USER_FONT_ERROR, 27,
    :CAIRO_STATUS_NEGATIVE_COUNT, 28,
    :CAIRO_STATUS_INVALID_CLUSTERS, 29,
    :CAIRO_STATUS_INVALID_SLANT, 30,
    :CAIRO_STATUS_INVALID_WEIGHT, 31,
    :CAIRO_STATUS_INVALID_SIZE, 32,
    :CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED, 33,
    :CAIRO_STATUS_DEVICE_TYPE_MISMATCH, 34,
    :CAIRO_STATUS_DEVICE_ERROR, 35,
    :CAIRO_STATUS_INVALID_MESH_CONSTRUCTION, 36,
    :CAIRO_STATUS_DEVICE_FINISHED, 37,
    :CAIRO_STATUS_LAST_STATUS, 38
  ]

  typedef :_cairo_status, :cairo_status_t

  enum :_cairo_content, [
    :CAIRO_CONTENT_COLOR, 4096,
    :CAIRO_CONTENT_ALPHA, 8192,
    :CAIRO_CONTENT_COLOR_ALPHA, 12_288
  ]

  typedef :_cairo_content, :cairo_content_t

  enum :_cairo_format, [
    :CAIRO_FORMAT_INVALID, 4_294_967_295,
    :CAIRO_FORMAT_ARGB32, 0,
    :CAIRO_FORMAT_RGB24, 1,
    :CAIRO_FORMAT_A8, 2,
    :CAIRO_FORMAT_A1, 3,
    :CAIRO_FORMAT_RGB16_565, 4,
    :CAIRO_FORMAT_RGB30, 5
  ]

  typedef :_cairo_format, :cairo_format_t

  typedef :pointer, :cairo_write_func_t

  typedef :pointer, :cairo_read_func_t

  class C_Cairo_Rectangle_Int < FFI::Union
    layout \
      :x, :int,
      :y, :int,
      :width, :int,
      :height, :int
  end

  Cairo_Rectangle_Int_T = C_Cairo_Rectangle_Int

  attach_function 'cairo_create', [
    :pointer
  ], :pointer

  attach_function 'cairo_reference', [
    :pointer
  ], :pointer

  attach_function 'cairo_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_get_reference_count', [
    :pointer
  ], :uint

  attach_function 'cairo_get_user_data', %i[
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_set_user_data', %i[
    pointer
    pointer
    pointer
    cairo_destroy_func_t
  ], :cairo_status_t

  attach_function 'cairo_save', [
    :pointer
  ], :void

  attach_function 'cairo_restore', [
    :pointer
  ], :void

  attach_function 'cairo_push_group', [
    :pointer
  ], :void

  attach_function 'cairo_push_group_with_content', %i[
    pointer
    cairo_content_t
  ], :void

  attach_function 'cairo_pop_group', [
    :pointer
  ], :pointer

  attach_function 'cairo_pop_group_to_source', [
    :pointer
  ], :void

  enum :_cairo_operator, [
    :CAIRO_OPERATOR_CLEAR, 0,
    :CAIRO_OPERATOR_SOURCE, 1,
    :CAIRO_OPERATOR_OVER, 2,
    :CAIRO_OPERATOR_IN, 3,
    :CAIRO_OPERATOR_OUT, 4,
    :CAIRO_OPERATOR_ATOP, 5,
    :CAIRO_OPERATOR_DEST, 6,
    :CAIRO_OPERATOR_DEST_OVER, 7,
    :CAIRO_OPERATOR_DEST_IN, 8,
    :CAIRO_OPERATOR_DEST_OUT, 9,
    :CAIRO_OPERATOR_DEST_ATOP, 10,
    :CAIRO_OPERATOR_XOR, 11,
    :CAIRO_OPERATOR_ADD, 12,
    :CAIRO_OPERATOR_SATURATE, 13,
    :CAIRO_OPERATOR_MULTIPLY, 14,
    :CAIRO_OPERATOR_SCREEN, 15,
    :CAIRO_OPERATOR_OVERLAY, 16,
    :CAIRO_OPERATOR_DARKEN, 17,
    :CAIRO_OPERATOR_LIGHTEN, 18,
    :CAIRO_OPERATOR_COLOR_DODGE, 19,
    :CAIRO_OPERATOR_COLOR_BURN, 20,
    :CAIRO_OPERATOR_HARD_LIGHT, 21,
    :CAIRO_OPERATOR_SOFT_LIGHT, 22,
    :CAIRO_OPERATOR_DIFFERENCE, 23,
    :CAIRO_OPERATOR_EXCLUSION, 24,
    :CAIRO_OPERATOR_HSL_HUE, 25,
    :CAIRO_OPERATOR_HSL_SATURATION, 26,
    :CAIRO_OPERATOR_HSL_COLOR, 27,
    :CAIRO_OPERATOR_HSL_LUMINOSITY, 28
  ]

  typedef :_cairo_operator, :cairo_operator_t

  attach_function 'cairo_set_operator', %i[
    pointer
    cairo_operator_t
  ], :void

  attach_function 'cairo_set_source', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_set_source_rgb', %i[
    pointer
    double
    double
    double
  ], :void

  attach_function 'cairo_set_source_rgba', %i[
    pointer
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_set_source_surface', %i[
    pointer
    pointer
    double
    double
  ], :void

  attach_function 'cairo_set_tolerance', %i[
    pointer
    double
  ], :void

  enum :_cairo_antialias, [
    :CAIRO_ANTIALIAS_DEFAULT, 0,
    :CAIRO_ANTIALIAS_NONE, 1,
    :CAIRO_ANTIALIAS_GRAY, 2,
    :CAIRO_ANTIALIAS_SUBPIXEL, 3,
    :CAIRO_ANTIALIAS_FAST, 4,
    :CAIRO_ANTIALIAS_GOOD, 5,
    :CAIRO_ANTIALIAS_BEST, 6
  ]

  typedef :_cairo_antialias, :cairo_antialias_t

  attach_function 'cairo_set_antialias', %i[
    pointer
    cairo_antialias_t
  ], :void

  enum :_cairo_fill_rule, [
    :CAIRO_FILL_RULE_WINDING, 0,
    :CAIRO_FILL_RULE_EVEN_ODD, 1
  ]

  typedef :_cairo_fill_rule, :cairo_fill_rule_t

  attach_function 'cairo_set_fill_rule', %i[
    pointer
    cairo_fill_rule_t
  ], :void

  attach_function 'cairo_set_line_width', %i[
    pointer
    double
  ], :void

  enum :_cairo_line_cap, [
    :CAIRO_LINE_CAP_BUTT, 0,
    :CAIRO_LINE_CAP_ROUND, 1,
    :CAIRO_LINE_CAP_SQUARE, 2
  ]

  typedef :_cairo_line_cap, :cairo_line_cap_t

  attach_function 'cairo_set_line_cap', %i[
    pointer
    cairo_line_cap_t
  ], :void

  enum :_cairo_line_join, [
    :CAIRO_LINE_JOIN_MITER, 0,
    :CAIRO_LINE_JOIN_ROUND, 1,
    :CAIRO_LINE_JOIN_BEVEL, 2
  ]

  typedef :_cairo_line_join, :cairo_line_join_t

  attach_function 'cairo_set_line_join', %i[
    pointer
    cairo_line_join_t
  ], :void

  attach_function 'cairo_set_dash', %i[
    pointer
    pointer
    int
    double
  ], :void

  attach_function 'cairo_set_miter_limit', %i[
    pointer
    double
  ], :void

  attach_function 'cairo_translate', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_scale', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_rotate', %i[
    pointer
    double
  ], :void

  attach_function 'cairo_transform', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_set_matrix', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_identity_matrix', [
    :pointer
  ], :void

  attach_function 'cairo_user_to_device', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_user_to_device_distance', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_device_to_user', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_device_to_user_distance', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_new_path', [
    :pointer
  ], :void

  attach_function 'cairo_move_to', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_new_sub_path', [
    :pointer
  ], :void

  attach_function 'cairo_line_to', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_curve_to', %i[
    pointer
    double
    double
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_arc', %i[
    pointer
    double
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_arc_negative', %i[
    pointer
    double
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_rel_move_to', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_rel_line_to', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_rel_curve_to', %i[
    pointer
    double
    double
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_rectangle', %i[
    pointer
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_close_path', [
    :pointer
  ], :void

  attach_function 'cairo_path_extents', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_paint', [
    :pointer
  ], :void

  attach_function 'cairo_paint_with_alpha', %i[
    pointer
    double
  ], :void

  attach_function 'cairo_mask', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_mask_surface', %i[
    pointer
    pointer
    double
    double
  ], :void

  attach_function 'cairo_stroke', [
    :pointer
  ], :void

  attach_function 'cairo_stroke_preserve', [
    :pointer
  ], :void

  attach_function 'cairo_fill', [
    :pointer
  ], :void

  attach_function 'cairo_fill_preserve', [
    :pointer
  ], :void

  attach_function 'cairo_copy_page', [
    :pointer
  ], :void

  attach_function 'cairo_show_page', [
    :pointer
  ], :void

  attach_function 'cairo_in_stroke', %i[
    pointer
    double
    double
  ], :cairo_bool_t

  attach_function 'cairo_in_fill', %i[
    pointer
    double
    double
  ], :cairo_bool_t

  attach_function 'cairo_in_clip', %i[
    pointer
    double
    double
  ], :cairo_bool_t

  attach_function 'cairo_stroke_extents', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_fill_extents', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_reset_clip', [
    :pointer
  ], :void

  attach_function 'cairo_clip', [
    :pointer
  ], :void

  attach_function 'cairo_clip_preserve', [
    :pointer
  ], :void

  attach_function 'cairo_clip_extents', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :void

  class C_Cairo_Rectangle < FFI::Union
    layout \
      :x, :double,
      :y, :double,
      :width, :double,
      :height, :double
  end

  Cairo_Rectangle_T = C_Cairo_Rectangle

  class C_Cairo_Rectangle_List < FFI::Union
    layout \
      :status, :cairo_status_t,
      :rectangles, :pointer,
      :num_rectangles, :int
  end

  Cairo_Rectangle_List_T = C_Cairo_Rectangle_List

  attach_function 'cairo_copy_clip_rectangle_list', [
    :pointer
  ], :pointer

  attach_function 'cairo_rectangle_list_destroy', [
    :pointer
  ], :void

  class C_Cairo_Scaled_Font < FFI::Union
  end

  Cairo_Scaled_Font_T = C_Cairo_Scaled_Font

  class C_Cairo_Font_Face < FFI::Union
  end

  Cairo_Font_Face_T = C_Cairo_Font_Face

  class Anon_Type_0 < FFI::Union
    layout \
      :index, :ulong,
      :x, :double,
      :y, :double
  end

  Cairo_Glyph_T = Anon_Type_0

  attach_function 'cairo_glyph_allocate', [
    :int
  ], :pointer

  attach_function 'cairo_glyph_free', [
    :pointer
  ], :void

  class Anon_Type_1 < FFI::Union
    layout \
      :num_bytes, :int,
      :num_glyphs, :int
  end

  Cairo_Text_Cluster_T = Anon_Type_1

  attach_function 'cairo_text_cluster_allocate', [
    :int
  ], :pointer

  attach_function 'cairo_text_cluster_free', [
    :pointer
  ], :void

  enum :_cairo_text_cluster_flags, [
    :CAIRO_TEXT_CLUSTER_FLAG_BACKWARD, 1
  ]

  typedef :_cairo_text_cluster_flags, :cairo_text_cluster_flags_t

  class Anon_Type_2 < FFI::Union
    layout \
      :x_bearing, :double,
      :y_bearing, :double,
      :width, :double,
      :height, :double,
      :x_advance, :double,
      :y_advance, :double
  end

  Cairo_Text_Extents_T = Anon_Type_2

  class Anon_Type_3 < FFI::Union
    layout \
      :ascent, :double,
      :descent, :double,
      :height, :double,
      :max_x_advance, :double,
      :max_y_advance, :double
  end

  Cairo_Font_Extents_T = Anon_Type_3

  enum :_cairo_font_slant, [
    :CAIRO_FONT_SLANT_NORMAL, 0,
    :CAIRO_FONT_SLANT_ITALIC, 1,
    :CAIRO_FONT_SLANT_OBLIQUE, 2
  ]

  typedef :_cairo_font_slant, :cairo_font_slant_t

  enum :_cairo_font_weight, [
    :CAIRO_FONT_WEIGHT_NORMAL, 0,
    :CAIRO_FONT_WEIGHT_BOLD, 1
  ]

  typedef :_cairo_font_weight, :cairo_font_weight_t

  enum :_cairo_subpixel_order, [
    :CAIRO_SUBPIXEL_ORDER_DEFAULT, 0,
    :CAIRO_SUBPIXEL_ORDER_RGB, 1,
    :CAIRO_SUBPIXEL_ORDER_BGR, 2,
    :CAIRO_SUBPIXEL_ORDER_VRGB, 3,
    :CAIRO_SUBPIXEL_ORDER_VBGR, 4
  ]

  typedef :_cairo_subpixel_order, :cairo_subpixel_order_t

  enum :_cairo_hint_style, [
    :CAIRO_HINT_STYLE_DEFAULT, 0,
    :CAIRO_HINT_STYLE_NONE, 1,
    :CAIRO_HINT_STYLE_SLIGHT, 2,
    :CAIRO_HINT_STYLE_MEDIUM, 3,
    :CAIRO_HINT_STYLE_FULL, 4
  ]

  typedef :_cairo_hint_style, :cairo_hint_style_t

  enum :_cairo_hint_metrics, [
    :CAIRO_HINT_METRICS_DEFAULT, 0,
    :CAIRO_HINT_METRICS_OFF, 1,
    :CAIRO_HINT_METRICS_ON, 2
  ]

  typedef :_cairo_hint_metrics, :cairo_hint_metrics_t

  class C_Cairo_Font_Options < FFI::Union
  end

  Cairo_Font_Options_T = C_Cairo_Font_Options

  attach_function 'cairo_font_options_create', [], :pointer

  attach_function 'cairo_font_options_copy', [
    :pointer
  ], :pointer

  attach_function 'cairo_font_options_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_font_options_status', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_font_options_merge', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_font_options_equal', %i[
    pointer
    pointer
  ], :cairo_bool_t

  attach_function 'cairo_font_options_hash', [
    :pointer
  ], :ulong

  attach_function 'cairo_font_options_set_antialias', %i[
    pointer
    cairo_antialias_t
  ], :void

  attach_function 'cairo_font_options_get_antialias', [
    :pointer
  ], :cairo_antialias_t

  attach_function 'cairo_font_options_set_subpixel_order', %i[
    pointer
    cairo_subpixel_order_t
  ], :void

  attach_function 'cairo_font_options_get_subpixel_order', [
    :pointer
  ], :cairo_subpixel_order_t

  attach_function 'cairo_font_options_set_hint_style', %i[
    pointer
    cairo_hint_style_t
  ], :void

  attach_function 'cairo_font_options_get_hint_style', [
    :pointer
  ], :cairo_hint_style_t

  attach_function 'cairo_font_options_set_hint_metrics', %i[
    pointer
    cairo_hint_metrics_t
  ], :void

  attach_function 'cairo_font_options_get_hint_metrics', [
    :pointer
  ], :cairo_hint_metrics_t

  attach_function 'cairo_select_font_face', %i[
    pointer
    string
    cairo_font_slant_t
    cairo_font_weight_t
  ], :void

  attach_function 'cairo_set_font_size', %i[
    pointer
    double
  ], :void

  attach_function 'cairo_set_font_matrix', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_get_font_matrix', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_set_font_options', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_get_font_options', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_set_font_face', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_get_font_face', [
    :pointer
  ], :pointer

  attach_function 'cairo_set_scaled_font', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_get_scaled_font', [
    :pointer
  ], :pointer

  attach_function 'cairo_show_text', %i[
    pointer
    string
  ], :void

  attach_function 'cairo_show_glyphs', %i[
    pointer
    pointer
    int
  ], :void

  attach_function 'cairo_show_text_glyphs', %i[
    pointer
    string
    int
    pointer
    int
    pointer
    int
    cairo_text_cluster_flags_t
  ], :void

  attach_function 'cairo_text_path', %i[
    pointer
    string
  ], :void

  attach_function 'cairo_glyph_path', %i[
    pointer
    pointer
    int
  ], :void

  attach_function 'cairo_text_extents', %i[
    pointer
    string
    pointer
  ], :void

  attach_function 'cairo_glyph_extents', %i[
    pointer
    pointer
    int
    pointer
  ], :void

  attach_function 'cairo_font_extents', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_font_face_reference', [
    :pointer
  ], :pointer

  attach_function 'cairo_font_face_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_font_face_get_reference_count', [
    :pointer
  ], :uint

  attach_function 'cairo_font_face_status', [
    :pointer
  ], :cairo_status_t

  enum :_cairo_font_type, [
    :CAIRO_FONT_TYPE_TOY, 0,
    :CAIRO_FONT_TYPE_FT, 1,
    :CAIRO_FONT_TYPE_WIN32, 2,
    :CAIRO_FONT_TYPE_QUARTZ, 3,
    :CAIRO_FONT_TYPE_USER, 4
  ]

  typedef :_cairo_font_type, :cairo_font_type_t

  attach_function 'cairo_font_face_get_type', [
    :pointer
  ], :cairo_font_type_t

  attach_function 'cairo_font_face_get_user_data', %i[
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_font_face_set_user_data', %i[
    pointer
    pointer
    pointer
    cairo_destroy_func_t
  ], :cairo_status_t

  attach_function 'cairo_scaled_font_create', %i[
    pointer
    pointer
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_scaled_font_reference', [
    :pointer
  ], :pointer

  attach_function 'cairo_scaled_font_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_scaled_font_get_reference_count', [
    :pointer
  ], :uint

  attach_function 'cairo_scaled_font_status', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_scaled_font_get_type', [
    :pointer
  ], :cairo_font_type_t

  attach_function 'cairo_scaled_font_get_user_data', %i[
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_scaled_font_set_user_data', %i[
    pointer
    pointer
    pointer
    cairo_destroy_func_t
  ], :cairo_status_t

  attach_function 'cairo_scaled_font_extents', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_scaled_font_text_extents', %i[
    pointer
    string
    pointer
  ], :void

  attach_function 'cairo_scaled_font_glyph_extents', %i[
    pointer
    pointer
    int
    pointer
  ], :void

  attach_function 'cairo_scaled_font_text_to_glyphs', %i[
    pointer
    double
    double
    string
    int
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_scaled_font_get_font_face', [
    :pointer
  ], :pointer

  attach_function 'cairo_scaled_font_get_font_matrix', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_scaled_font_get_ctm', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_scaled_font_get_scale_matrix', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_scaled_font_get_font_options', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_toy_font_face_create', %i[
    string
    cairo_font_slant_t
    cairo_font_weight_t
  ], :pointer

  attach_function 'cairo_toy_font_face_get_family', [
    :pointer
  ], :string

  attach_function 'cairo_toy_font_face_get_slant', [
    :pointer
  ], :cairo_font_slant_t

  attach_function 'cairo_toy_font_face_get_weight', [
    :pointer
  ], :cairo_font_weight_t

  attach_function 'cairo_user_font_face_create', [], :pointer

  typedef :pointer, :cairo_user_scaled_font_init_func_t

  typedef :pointer, :cairo_user_scaled_font_render_glyph_func_t

  typedef :pointer, :cairo_user_scaled_font_text_to_glyphs_func_t

  typedef :pointer, :cairo_user_scaled_font_unicode_to_glyph_func_t

  attach_function 'cairo_user_font_face_set_init_func', %i[
    pointer
    cairo_user_scaled_font_init_func_t
  ], :void

  attach_function 'cairo_user_font_face_set_render_glyph_func', %i[
    pointer
    cairo_user_scaled_font_render_glyph_func_t
  ], :void

  attach_function 'cairo_user_font_face_set_text_to_glyphs_func', %i[
    pointer
    cairo_user_scaled_font_text_to_glyphs_func_t
  ], :void

  attach_function 'cairo_user_font_face_set_unicode_to_glyph_func', %i[
    pointer
    cairo_user_scaled_font_unicode_to_glyph_func_t
  ], :void

  attach_function 'cairo_user_font_face_get_init_func', [
    :pointer
  ], :cairo_user_scaled_font_init_func_t

  attach_function 'cairo_user_font_face_get_render_glyph_func', [
    :pointer
  ], :cairo_user_scaled_font_render_glyph_func_t

  attach_function 'cairo_user_font_face_get_text_to_glyphs_func', [
    :pointer
  ], :cairo_user_scaled_font_text_to_glyphs_func_t

  attach_function 'cairo_user_font_face_get_unicode_to_glyph_func', [
    :pointer
  ], :cairo_user_scaled_font_unicode_to_glyph_func_t

  attach_function 'cairo_get_operator', [
    :pointer
  ], :cairo_operator_t

  attach_function 'cairo_get_source', [
    :pointer
  ], :pointer

  attach_function 'cairo_get_tolerance', [
    :pointer
  ], :double

  attach_function 'cairo_get_antialias', [
    :pointer
  ], :cairo_antialias_t

  attach_function 'cairo_has_current_point', [
    :pointer
  ], :cairo_bool_t

  attach_function 'cairo_get_current_point', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_get_fill_rule', [
    :pointer
  ], :cairo_fill_rule_t

  attach_function 'cairo_get_line_width', [
    :pointer
  ], :double

  attach_function 'cairo_get_line_cap', [
    :pointer
  ], :cairo_line_cap_t

  attach_function 'cairo_get_line_join', [
    :pointer
  ], :cairo_line_join_t

  attach_function 'cairo_get_miter_limit', [
    :pointer
  ], :double

  attach_function 'cairo_get_dash_count', [
    :pointer
  ], :int

  attach_function 'cairo_get_dash', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_get_matrix', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_get_target', [
    :pointer
  ], :pointer

  attach_function 'cairo_get_group_target', [
    :pointer
  ], :pointer

  enum :_cairo_path_data_type, [
    :CAIRO_PATH_MOVE_TO, 0,
    :CAIRO_PATH_LINE_TO, 1,
    :CAIRO_PATH_CURVE_TO, 2,
    :CAIRO_PATH_CLOSE_PATH, 3
  ]

  typedef :_cairo_path_data_type, :cairo_path_data_type_t

  class C_Cairo_Path_Data_T < FFI::Union
  end

  Cairo_Path_Data_T = C_Cairo_Path_Data_T

  class Anon_Type_4 < FFI::Union
    layout \
      :type, :cairo_path_data_type_t,
      :length, :int
  end

  class Anon_Type_5 < FFI::Union
    layout \
      :x, :double,
      :y, :double
  end

  class C_Cairo_Path_Data_T < FFI::Union
    layout \
      :header, Anon_Type_4,
      :point, Anon_Type_5
  end

  class Cairo_Path < FFI::Union
    layout \
      :status, :cairo_status_t,
      :data, :pointer,
      :num_data, :int
  end

  Cairo_Path_T = Cairo_Path

  attach_function 'cairo_copy_path', [
    :pointer
  ], :pointer

  attach_function 'cairo_copy_path_flat', [
    :pointer
  ], :pointer

  attach_function 'cairo_append_path', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_path_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_status', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_status_to_string', [
    :cairo_status_t
  ], :string

  attach_function 'cairo_device_reference', [
    :pointer
  ], :pointer

  enum :_cairo_device_type, [
    :CAIRO_DEVICE_TYPE_DRM, 0,
    :CAIRO_DEVICE_TYPE_GL, 1,
    :CAIRO_DEVICE_TYPE_SCRIPT, 2,
    :CAIRO_DEVICE_TYPE_XCB, 3,
    :CAIRO_DEVICE_TYPE_XLIB, 4,
    :CAIRO_DEVICE_TYPE_XML, 5,
    :CAIRO_DEVICE_TYPE_COGL, 6,
    :CAIRO_DEVICE_TYPE_WIN32, 7,
    :CAIRO_DEVICE_TYPE_INVALID, 4_294_967_295
  ]

  typedef :_cairo_device_type, :cairo_device_type_t

  attach_function 'cairo_device_get_type', [
    :pointer
  ], :cairo_device_type_t

  attach_function 'cairo_device_status', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_device_acquire', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_device_release', [
    :pointer
  ], :void

  attach_function 'cairo_device_flush', [
    :pointer
  ], :void

  attach_function 'cairo_device_finish', [
    :pointer
  ], :void

  attach_function 'cairo_device_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_device_get_reference_count', [
    :pointer
  ], :uint

  attach_function 'cairo_device_get_user_data', %i[
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_device_set_user_data', %i[
    pointer
    pointer
    pointer
    cairo_destroy_func_t
  ], :cairo_status_t

  attach_function 'cairo_surface_create_similar', %i[
    pointer
    cairo_content_t
    int
    int
  ], :pointer

  attach_function 'cairo_surface_create_similar_image', %i[
    pointer
    cairo_format_t
    int
    int
  ], :pointer

  attach_function 'cairo_surface_map_to_image', %i[
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_surface_unmap_image', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_surface_create_for_rectangle', %i[
    pointer
    double
    double
    double
    double
  ], :pointer

  enum :anon_type_6, [
    :CAIRO_SURFACE_OBSERVER_NORMAL, 0,
    :CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS, 1
  ]

  typedef :anon_type_6, :cairo_surface_observer_mode_t

  attach_function 'cairo_surface_create_observer', %i[
    pointer
    cairo_surface_observer_mode_t
  ], :pointer

  typedef :pointer, :cairo_surface_observer_callback_t

  attach_function 'cairo_surface_observer_add_paint_callback', %i[
    pointer
    cairo_surface_observer_callback_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_add_mask_callback', %i[
    pointer
    cairo_surface_observer_callback_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_add_fill_callback', %i[
    pointer
    cairo_surface_observer_callback_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_add_stroke_callback', %i[
    pointer
    cairo_surface_observer_callback_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_add_glyphs_callback', %i[
    pointer
    cairo_surface_observer_callback_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_add_flush_callback', %i[
    pointer
    cairo_surface_observer_callback_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_add_finish_callback', %i[
    pointer
    cairo_surface_observer_callback_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_print', %i[
    pointer
    cairo_write_func_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_observer_elapsed', [
    :pointer
  ], :double

  attach_function 'cairo_device_observer_print', %i[
    pointer
    cairo_write_func_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_device_observer_elapsed', [
    :pointer
  ], :double

  attach_function 'cairo_device_observer_paint_elapsed', [
    :pointer
  ], :double

  attach_function 'cairo_device_observer_mask_elapsed', [
    :pointer
  ], :double

  attach_function 'cairo_device_observer_fill_elapsed', [
    :pointer
  ], :double

  attach_function 'cairo_device_observer_stroke_elapsed', [
    :pointer
  ], :double

  attach_function 'cairo_device_observer_glyphs_elapsed', [
    :pointer
  ], :double

  attach_function 'cairo_surface_reference', [
    :pointer
  ], :pointer

  attach_function 'cairo_surface_finish', [
    :pointer
  ], :void

  attach_function 'cairo_surface_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_surface_get_device', [
    :pointer
  ], :pointer

  attach_function 'cairo_surface_get_reference_count', [
    :pointer
  ], :uint

  attach_function 'cairo_surface_status', [
    :pointer
  ], :cairo_status_t

  enum :_cairo_surface_type, [
    :CAIRO_SURFACE_TYPE_IMAGE, 0,
    :CAIRO_SURFACE_TYPE_PDF, 1,
    :CAIRO_SURFACE_TYPE_PS, 2,
    :CAIRO_SURFACE_TYPE_XLIB, 3,
    :CAIRO_SURFACE_TYPE_XCB, 4,
    :CAIRO_SURFACE_TYPE_GLITZ, 5,
    :CAIRO_SURFACE_TYPE_QUARTZ, 6,
    :CAIRO_SURFACE_TYPE_WIN32, 7,
    :CAIRO_SURFACE_TYPE_BEOS, 8,
    :CAIRO_SURFACE_TYPE_DIRECTFB, 9,
    :CAIRO_SURFACE_TYPE_SVG, 10,
    :CAIRO_SURFACE_TYPE_OS2, 11,
    :CAIRO_SURFACE_TYPE_WIN32_PRINTING, 12,
    :CAIRO_SURFACE_TYPE_QUARTZ_IMAGE, 13,
    :CAIRO_SURFACE_TYPE_SCRIPT, 14,
    :CAIRO_SURFACE_TYPE_QT, 15,
    :CAIRO_SURFACE_TYPE_RECORDING, 16,
    :CAIRO_SURFACE_TYPE_VG, 17,
    :CAIRO_SURFACE_TYPE_GL, 18,
    :CAIRO_SURFACE_TYPE_DRM, 19,
    :CAIRO_SURFACE_TYPE_TEE, 20,
    :CAIRO_SURFACE_TYPE_XML, 21,
    :CAIRO_SURFACE_TYPE_SKIA, 22,
    :CAIRO_SURFACE_TYPE_SUBSURFACE, 23,
    :CAIRO_SURFACE_TYPE_COGL, 24
  ]

  typedef :_cairo_surface_type, :cairo_surface_type_t

  attach_function 'cairo_surface_get_type', [
    :pointer
  ], :cairo_surface_type_t

  attach_function 'cairo_surface_get_content', [
    :pointer
  ], :cairo_content_t

  attach_function 'cairo_surface_write_to_png', %i[
    pointer
    string
  ], :cairo_status_t

  attach_function 'cairo_surface_write_to_png_stream', %i[
    pointer
    cairo_write_func_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_get_user_data', %i[
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_surface_set_user_data', %i[
    pointer
    pointer
    pointer
    cairo_destroy_func_t
  ], :cairo_status_t

  attach_function 'cairo_surface_get_mime_data', %i[
    pointer
    string
    pointer
    pointer
  ], :void

  attach_function 'cairo_surface_set_mime_data', %i[
    pointer
    string
    string
    ulong
    cairo_destroy_func_t
    pointer
  ], :cairo_status_t

  attach_function 'cairo_surface_supports_mime_type', %i[
    pointer
    string
  ], :cairo_bool_t

  attach_function 'cairo_surface_get_font_options', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_surface_flush', [
    :pointer
  ], :void

  attach_function 'cairo_surface_mark_dirty', [
    :pointer
  ], :void

  attach_function 'cairo_surface_mark_dirty_rectangle', %i[
    pointer
    int
    int
    int
    int
  ], :void

  attach_function 'cairo_surface_set_device_offset', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_surface_get_device_offset', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_surface_set_fallback_resolution', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_surface_get_fallback_resolution', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_surface_copy_page', [
    :pointer
  ], :void

  attach_function 'cairo_surface_show_page', [
    :pointer
  ], :void

  attach_function 'cairo_surface_has_show_text_glyphs', [
    :pointer
  ], :cairo_bool_t

  attach_function 'cairo_image_surface_create', %i[
    cairo_format_t
    int
    int
  ], :pointer

  attach_function 'cairo_format_stride_for_width', %i[
    cairo_format_t
    int
  ], :int

  attach_function 'cairo_image_surface_create_for_data', %i[
    string
    cairo_format_t
    int
    int
    int
  ], :pointer

  attach_function 'cairo_image_surface_get_data', [
    :pointer
  ], :string

  attach_function 'cairo_image_surface_get_format', [
    :pointer
  ], :cairo_format_t

  attach_function 'cairo_image_surface_get_width', [
    :pointer
  ], :int

  attach_function 'cairo_image_surface_get_height', [
    :pointer
  ], :int

  attach_function 'cairo_image_surface_get_stride', [
    :pointer
  ], :int

  attach_function 'cairo_image_surface_create_from_png', [
    :string
  ], :pointer

  attach_function 'cairo_image_surface_create_from_png_stream', %i[
    cairo_read_func_t
    pointer
  ], :pointer

  attach_function 'cairo_recording_surface_create', %i[
    cairo_content_t
    pointer
  ], :pointer

  attach_function 'cairo_recording_surface_ink_extents', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_recording_surface_get_extents', %i[
    pointer
    pointer
  ], :cairo_bool_t

  typedef :pointer, :cairo_raster_source_acquire_func_t

  typedef :pointer, :cairo_raster_source_release_func_t

  typedef :pointer, :cairo_raster_source_snapshot_func_t

  typedef :pointer, :cairo_raster_source_copy_func_t

  typedef :pointer, :cairo_raster_source_finish_func_t

  attach_function 'cairo_pattern_create_raster_source', %i[
    pointer
    cairo_content_t
    int
    int
  ], :pointer

  attach_function 'cairo_raster_source_pattern_set_callback_data', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_raster_source_pattern_get_callback_data', [
    :pointer
  ], :pointer

  attach_function 'cairo_raster_source_pattern_set_acquire', %i[
    pointer
    cairo_raster_source_acquire_func_t
    cairo_raster_source_release_func_t
  ], :void

  attach_function 'cairo_raster_source_pattern_get_acquire', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_raster_source_pattern_set_snapshot', %i[
    pointer
    cairo_raster_source_snapshot_func_t
  ], :void

  attach_function 'cairo_raster_source_pattern_get_snapshot', [
    :pointer
  ], :cairo_raster_source_snapshot_func_t

  attach_function 'cairo_raster_source_pattern_set_copy', %i[
    pointer
    cairo_raster_source_copy_func_t
  ], :void

  attach_function 'cairo_raster_source_pattern_get_copy', [
    :pointer
  ], :cairo_raster_source_copy_func_t

  attach_function 'cairo_raster_source_pattern_set_finish', %i[
    pointer
    cairo_raster_source_finish_func_t
  ], :void

  attach_function 'cairo_raster_source_pattern_get_finish', [
    :pointer
  ], :cairo_raster_source_finish_func_t

  attach_function 'cairo_pattern_create_rgb', %i[
    double
    double
    double
  ], :pointer

  attach_function 'cairo_pattern_create_rgba', %i[
    double
    double
    double
    double
  ], :pointer

  attach_function 'cairo_pattern_create_for_surface', [
    :pointer
  ], :pointer

  attach_function 'cairo_pattern_create_linear', %i[
    double
    double
    double
    double
  ], :pointer

  attach_function 'cairo_pattern_create_radial', %i[
    double
    double
    double
    double
    double
    double
  ], :pointer

  attach_function 'cairo_pattern_create_mesh', [], :pointer

  attach_function 'cairo_pattern_reference', [
    :pointer
  ], :pointer

  attach_function 'cairo_pattern_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_pattern_get_reference_count', [
    :pointer
  ], :uint

  attach_function 'cairo_pattern_status', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_pattern_get_user_data', %i[
    pointer
    pointer
  ], :pointer

  attach_function 'cairo_pattern_set_user_data', %i[
    pointer
    pointer
    pointer
    cairo_destroy_func_t
  ], :cairo_status_t

  enum :_cairo_pattern_type, [
    :CAIRO_PATTERN_TYPE_SOLID, 0,
    :CAIRO_PATTERN_TYPE_SURFACE, 1,
    :CAIRO_PATTERN_TYPE_LINEAR, 2,
    :CAIRO_PATTERN_TYPE_RADIAL, 3,
    :CAIRO_PATTERN_TYPE_MESH, 4,
    :CAIRO_PATTERN_TYPE_RASTER_SOURCE, 5
  ]

  typedef :_cairo_pattern_type, :cairo_pattern_type_t

  attach_function 'cairo_pattern_get_type', [
    :pointer
  ], :cairo_pattern_type_t

  attach_function 'cairo_pattern_add_color_stop_rgb', %i[
    pointer
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_pattern_add_color_stop_rgba', %i[
    pointer
    double
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_mesh_pattern_begin_patch', [
    :pointer
  ], :void

  attach_function 'cairo_mesh_pattern_end_patch', [
    :pointer
  ], :void

  attach_function 'cairo_mesh_pattern_curve_to', %i[
    pointer
    double
    double
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_mesh_pattern_line_to', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_mesh_pattern_move_to', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_mesh_pattern_set_control_point', %i[
    pointer
    uint
    double
    double
  ], :void

  attach_function 'cairo_mesh_pattern_set_corner_color_rgb', %i[
    pointer
    uint
    double
    double
    double
  ], :void

  attach_function 'cairo_mesh_pattern_set_corner_color_rgba', %i[
    pointer
    uint
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_pattern_set_matrix', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_pattern_get_matrix', %i[
    pointer
    pointer
  ], :void

  enum :_cairo_extend, [
    :CAIRO_EXTEND_NONE, 0,
    :CAIRO_EXTEND_REPEAT, 1,
    :CAIRO_EXTEND_REFLECT, 2,
    :CAIRO_EXTEND_PAD, 3
  ]

  typedef :_cairo_extend, :cairo_extend_t

  attach_function 'cairo_pattern_set_extend', %i[
    pointer
    cairo_extend_t
  ], :void

  attach_function 'cairo_pattern_get_extend', [
    :pointer
  ], :cairo_extend_t

  enum :_cairo_filter, [
    :CAIRO_FILTER_FAST, 0,
    :CAIRO_FILTER_GOOD, 1,
    :CAIRO_FILTER_BEST, 2,
    :CAIRO_FILTER_NEAREST, 3,
    :CAIRO_FILTER_BILINEAR, 4,
    :CAIRO_FILTER_GAUSSIAN, 5
  ]

  typedef :_cairo_filter, :cairo_filter_t

  attach_function 'cairo_pattern_set_filter', %i[
    pointer
    cairo_filter_t
  ], :void

  attach_function 'cairo_pattern_get_filter', [
    :pointer
  ], :cairo_filter_t

  attach_function 'cairo_pattern_get_rgba', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_pattern_get_surface', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_pattern_get_color_stop_rgba', %i[
    pointer
    int
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_pattern_get_color_stop_count', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_pattern_get_linear_points', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_pattern_get_radial_circles', %i[
    pointer
    pointer
    pointer
    pointer
    pointer
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_mesh_pattern_get_patch_count', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_mesh_pattern_get_path', %i[
    pointer
    uint
  ], :pointer

  attach_function 'cairo_mesh_pattern_get_corner_color_rgba', %i[
    pointer
    uint
    uint
    pointer
    pointer
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_mesh_pattern_get_control_point', %i[
    pointer
    uint
    uint
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_matrix_init', %i[
    pointer
    double
    double
    double
    double
    double
    double
  ], :void

  attach_function 'cairo_matrix_init_identity', [
    :pointer
  ], :void

  attach_function 'cairo_matrix_init_translate', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_matrix_init_scale', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_matrix_init_rotate', %i[
    pointer
    double
  ], :void

  attach_function 'cairo_matrix_translate', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_matrix_scale', %i[
    pointer
    double
    double
  ], :void

  attach_function 'cairo_matrix_rotate', %i[
    pointer
    double
  ], :void

  attach_function 'cairo_matrix_invert', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_matrix_multiply', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_matrix_transform_distance', %i[
    pointer
    pointer
    pointer
  ], :void

  attach_function 'cairo_matrix_transform_point', %i[
    pointer
    pointer
    pointer
  ], :void

  class C_Cairo_Region < FFI::Union
  end

  Cairo_Region_T = C_Cairo_Region

  enum :_cairo_region_overlap, [
    :CAIRO_REGION_OVERLAP_IN, 0,
    :CAIRO_REGION_OVERLAP_OUT, 1,
    :CAIRO_REGION_OVERLAP_PART, 2
  ]

  typedef :_cairo_region_overlap, :cairo_region_overlap_t

  attach_function 'cairo_region_create', [], :pointer

  attach_function 'cairo_region_create_rectangle', [
    :pointer
  ], :pointer

  attach_function 'cairo_region_create_rectangles', %i[
    pointer
    int
  ], :pointer

  attach_function 'cairo_region_copy', [
    :pointer
  ], :pointer

  attach_function 'cairo_region_reference', [
    :pointer
  ], :pointer

  attach_function 'cairo_region_destroy', [
    :pointer
  ], :void

  attach_function 'cairo_region_equal', %i[
    pointer
    pointer
  ], :cairo_bool_t

  attach_function 'cairo_region_status', [
    :pointer
  ], :cairo_status_t

  attach_function 'cairo_region_get_extents', %i[
    pointer
    pointer
  ], :void

  attach_function 'cairo_region_num_rectangles', [
    :pointer
  ], :int

  attach_function 'cairo_region_get_rectangle', %i[
    pointer
    int
    pointer
  ], :void

  attach_function 'cairo_region_is_empty', [
    :pointer
  ], :cairo_bool_t

  attach_function 'cairo_region_contains_rectangle', %i[
    pointer
    pointer
  ], :cairo_region_overlap_t

  attach_function 'cairo_region_contains_point', %i[
    pointer
    int
    int
  ], :cairo_bool_t

  attach_function 'cairo_region_translate', %i[
    pointer
    int
    int
  ], :void

  attach_function 'cairo_region_subtract', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_region_subtract_rectangle', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_region_intersect', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_region_intersect_rectangle', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_region_union', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_region_union_rectangle', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_region_xor', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_region_xor_rectangle', %i[
    pointer
    pointer
  ], :cairo_status_t

  attach_function 'cairo_debug_reset_static_data', [], :void

  CAIRO_HAS_SCRIPT_SURFACE = 1

  CAIRO_HAS_TEE_SURFACE = 1

  CAIRO_HAS_SVG_SURFACE = 1

  CAIRO_HAS_XCB_SHM_FUNCTIONS = 1

  CAIRO_HAS_USER_FONT = 1

  CAIRO_HAS_XLIB_SURFACE = 1

  CAIRO_HAS_XCB_SURFACE = 1

  CAIRO_HAS_IMAGE_SURFACE = 1

  CAIRO_HAS_GOBJECT_FUNCTIONS = 1

  CAIRO_HAS_OBSERVER_SURFACE = 1

  CAIRO_HAS_MIME_SURFACE = 1

  CAIRO_HAS_PDF_SURFACE = 1

  CAIRO_HAS_PNG_FUNCTIONS = 1

  CAIRO_HAS_RECORDING_SURFACE = 1

  CAIRO_HAS_PS_SURFACE = 1

  CAIRO_HAS_FC_FONT = 1

  CAIRO_HAS_GL_SURFACE = 1

  CAIRO_HAS_FT_FONT = 1

  CAIRO_HAS_GLX_FUNCTIONS = 1

  CAIRO_HAS_XLIB_XRENDER_SURFACE = 1

  CAIRO_HAS_EGL_FUNCTIONS = 1

  CAIRO_VERSION_MICRO = 10

  CAIRO_VERSION_MINOR = 12

  CAIRO_VERSION_MAJOR = 1

  CAIRO_MIME_TYPE_PNG = 'image/png'

  CAIRO_MIME_TYPE_JP2 = 'image/jp2'

  CAIRO_MIME_TYPE_JPEG = 'image/jpeg'

  CAIRO_MIME_TYPE_UNIQUE_ID = 'application/x-cairo.uuid'

  CAIRO_MIME_TYPE_URI = 'text/x-uri'
end
