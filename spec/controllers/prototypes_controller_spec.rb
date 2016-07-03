
require 'rails_helper'

describe PrototypesController do
   let(:prototype) { create(:prototype, :with_sub_images) }
   let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: 'sample', tag_list: 'sample')
   }}
   let(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: nil, tag_list: 'sample')
   }}
end
