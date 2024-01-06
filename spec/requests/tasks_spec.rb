require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /index" do
    let(:tasks) { create_list(:task, 10) }

    before do
      tasks
      get tasks_path
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(JSON.parse(response.body)).to eq(tasks.as_json) }
  end

  describe "GET /show" do
    context "valid params" do
      let(:task) { create(:task) }

      before { get task_path(task) }

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)).to eq(task.as_json) }
    end

    context "invalid params" do
      before { get "/tasks/#{0}" }

      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe "POST /create" do
    context "valid params" do
      let(:task) { build(:task) }

      before { post "/tasks", params: { task: task.attributes } }

      it { expect(response).to have_http_status(:created) }
      it { expect(JSON.parse(response.body)).to eq(Task.last.as_json)}
    end

    context "invalid params" do
      before { post "/tasks", params: { task: { "name": "", "description": "" } } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "PATCH /update" do
    context "valid params" do
      let(:task) { create(:task) }
      let(:new_name) { "novo nome de tarefa" }

      before { patch "/tasks/#{task.id}", params: { task: { name: new_name } } }

      it { expect(response).to have_http_status(:success) }
      it { expect(JSON.parse(response.body)["name"]).to eq(new_name)}
    end

    context "invalid params" do
      let(:task) { create(:task) }

      before { patch "/tasks/#{task.id}", params: { task: { name: "" } } }
      it { expect(response).to have_http_status(:unprocessable_entity)}
    end
  end

  describe "DELETE destroy" do
    let(:task) { create(:task) }

    before { delete "/tasks/#{task.id}" }

    it { expect(response).to have_http_status(:ok) }
  end
end
