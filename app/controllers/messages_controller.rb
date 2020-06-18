class MessagesController < ApplicationController
    # Adds index to render json localhost:3000/messages
    def index
        messages = Message.all
        render json: messages.to_json(:include => {
            :bike_trail => {:only => [:name, :distance, :counter_location]}
        }, :except => [:created_at, :updated_at])
    end

    def new
        message = Message.new
    end

    def create
        message = Message.create(message_params)
        render json: message.to_json(:include => {
            :bike_trail => {:only => [:name, :distance, :counter_location]}
        }, :except => [:created_at, :updated_at])
    end

    def edit
        message = Message.find(params[:id])
    end

    def update
        message = Message.find(params[:id])
        message.update(message_params)
        render json: message.to_json(:include => {
            :bike_trail => {:only => [:name, :distance, :counter_location]}
        }, :except => [:created_at, :updated_at])
    end

    def destroy
        message = Message.find(params[:id])
        message.destroy
        render json: message.to_json(:include => {
            :bike_trail => {:only => [:name, :distance, :counter_location]}
        }, :except => [:created_at, :updated_at])
    end

    private

    def message_params
        params.require(:message).permit(:user_name, :content, :bike_trail_id)
    end
end
