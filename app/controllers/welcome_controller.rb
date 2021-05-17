class WelcomeController < ApplicationController

    def home
        redirect_to posts_path
    end

    # - create 
    #     - new // refers method in controller
    #         - renders // get request
    #     - create // method
    #         - redirect // post request
    # - read
    #     - index // method
    #         - render // get request
    #     - show // method
    #         - render // get request
    # - update
    #     - edit // method
    #         - render // get request
    #     - update // method
    #         - redirect // patch request
    # - delete
    #     - destroy // method
    #         - redirect // delete request

end
