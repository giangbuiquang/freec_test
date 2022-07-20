class Api::V1::UsersController < Api::V1::ApiV1BaseController
  before_action :set_record, only: [:show, :destroy, :update]
  before_action :check_not_admin_user, only: [:destroy, :update]

  def index
    @q = User.ransack(params[:q])
    current_page = params[:page] || 1

    pagy, @users = pagy @q.result, items: params[:items], page: current_page

    render json: {
      users:         serialize_columns( @users, %i[id name nickname image email role]),
      current_page:  pagy.page,
      total_page:    pagy.pages,
      total_count:   pagy.count

    }, status: :ok

  end

  def show
    render json: serialize_columns(@record, %i[id name nickname image email role] ), status: :ok
  end

  def update

    @record.attributes = record_params
    if @record.save
      return render json: serialize_columns( @record, %i[id name nickname image email role]) , status: :ok
    end
    render json: {errors: @record.errors.full_messages}, status: :bad_request
  end

  def destroy
    if @record.destroy
      return render json: { messages: "Successfully delete !" }, status: :ok 
    end
    render json: {errors: @record.errors.full_messages}, status: :bad_request
  end


  private
  def set_record
    @record = User.find_by_id(params[:id])
    return render json: { errors: [User.not_found_message] }, status: :not_found if @record.blank?
   
  end

  def record_params
    params[:user].permit( :name,
                          :nickname,
                          :image )
  end

  def serialize_columns record, columns
    record.as_json(
      only: columns
    )
  end

  def check_not_admin_user
    @record = User.find_by_id(params[:id])
    if @record.present? and @record.is_admin?
      return render json: { errors: ["You are not allow to modify this user"] }, status: :non_authoritative_information 
    end
  end

end


