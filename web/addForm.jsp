<div class="row mt-3">
    <div class="col-12">
        <label>NAME: </label>
    </div>
</div>
<div class="row mt-1" >
    <div class="col-12">
        <input type="text" class="form-control " name="task_name" placeholder="Name..." required>
    </div>
</div>
<div class="row mt-3">
    <div class="col-12">
        <label>DESCRIPTION: </label>
    </div>
</div>
<div class="row mt-1" >
    <div class="col-12">
        <textarea class="form-control" name="task_description" rows="5" placeholder="Description..."></textarea>
    </div>
</div>
<div class="row mt-3">
    <div class="col-12">
        <label>DEADLINE: </label>
    </div>
</div>
<div class="row mt-1" >
    <div class="col-12">
        <input type="date" class="form-control" name="task_deadline">
    </div>
</div>
<div class="row mt-3">
    <div class="col-12">
        <label>STATUS: </label>
    </div>
</div>
<div class="row mt-1 mb-5" >
    <div class="col-12">
        <select class="form-select" name="task_status">
            <option value="1">Done</option>
            <option value="0">Not</option>
        </select>
    </div>
</div>
<div class="row mt-3 text-sm-end">
    <div class="col-12">
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button class="btn btn-primary ms-2">Add</button>
        </div>
    </div>
</div>