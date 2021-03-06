# Super Admin User can manage the stores
class Superadmin::StoresController < Superadmin::ApplicationController
  load_and_authorize_resource

  def index
    @stores = Store.not_declined
    render :layout => 'layouts/admin'
  end

  def update
    store = Store.find(params[:id])
    prev_status = store.status
    store.set_status!(params[:status])
    send_notification(store) if prev_status == 'pending'

    redirect_to superadmin_stores_path, :notice => 'Status changed'
  end

  private

  def send_notification(store)
    store.send_accepted_email if store.active?
    store.send_declined_email if store.declined?
  end
end
