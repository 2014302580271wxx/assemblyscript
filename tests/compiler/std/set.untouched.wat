(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iij (func (param i32 i64) (result i32)))
 (type $FUNCSIG$ij (func (param i64) (result i32)))
 (type $FUNCSIG$iiji (func (param i32 i64 i32) (result i32)))
 (type $FUNCSIG$vij (func (param i32 i64)))
 (type $FUNCSIG$iif (func (param i32 f32) (result i32)))
 (type $FUNCSIG$iifi (func (param i32 f32 i32) (result i32)))
 (type $FUNCSIG$vif (func (param i32 f32)))
 (type $FUNCSIG$iid (func (param i32 f64) (result i32)))
 (type $FUNCSIG$iidi (func (param i32 f64 i32) (result i32)))
 (type $FUNCSIG$vid (func (param i32 f64)))
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 8) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00u\00n\00t\00i\00m\00e\00.\00t\00s\00")
 (data (i32.const 48) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 96) "\02\00\00\00\14\00\00\00s\00t\00d\00/\00s\00e\00t\00.\00t\00s\00")
 (table $0 1 funcref)
 (elem (i32.const 0) $null)
 (global $~lib/runtime/GC_IMPLEMENTED i32 (i32.const 0))
 (global $~lib/runtime/HEADER_SIZE i32 (i32.const 8))
 (global $~lib/runtime/HEADER_MAGIC i32 (i32.const -1520547049))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/ASC_NO_ASSERT i32 (i32.const 0))
 (global $~lib/runtime/MAX_BYTELENGTH i32 (i32.const 1073741816))
 (global $~lib/memory/HEAP_BASE i32 (i32.const 124))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $~lib/runtime/ADJUSTOBLOCK (; 1 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const 1
  i32.const 32
  local.get $0
  global.get $~lib/runtime/HEADER_SIZE
  i32.add
  i32.const 1
  i32.sub
  i32.clz
  i32.sub
  i32.shl
 )
 (func $~lib/memory/memory.allocate (; 2 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $~lib/allocator/arena/__memory_allocate|inlined.0 (result i32)
   local.get $0
   local.set $1
   local.get $1
   i32.const 1073741824
   i32.gt_u
   if
    unreachable
   end
   global.get $~lib/allocator/arena/offset
   local.set $2
   local.get $2
   local.get $1
   local.tee $3
   i32.const 1
   local.tee $4
   local.get $3
   local.get $4
   i32.gt_u
   select
   i32.add
   i32.const 7
   i32.add
   i32.const 7
   i32.const -1
   i32.xor
   i32.and
   local.set $3
   current_memory
   local.set $4
   local.get $3
   local.get $4
   i32.const 16
   i32.shl
   i32.gt_u
   if
    local.get $3
    local.get $2
    i32.sub
    i32.const 65535
    i32.add
    i32.const 65535
    i32.const -1
    i32.xor
    i32.and
    i32.const 16
    i32.shr_u
    local.set $5
    local.get $4
    local.tee $6
    local.get $5
    local.tee $7
    local.get $6
    local.get $7
    i32.gt_s
    select
    local.set $6
    local.get $6
    grow_memory
    i32.const 0
    i32.lt_s
    if
     local.get $5
     grow_memory
     i32.const 0
     i32.lt_s
     if
      unreachable
     end
    end
   end
   local.get $3
   global.set $~lib/allocator/arena/offset
   local.get $2
  end
  return
 )
 (func $~lib/runtime/doAllocate (; 3 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/runtime/ADJUSTOBLOCK
  call $~lib/memory/memory.allocate
  local.set $1
  local.get $1
  global.get $~lib/runtime/HEADER_MAGIC
  i32.store
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
  global.get $~lib/runtime/HEADER_SIZE
  i32.add
 )
 (func $~lib/runtime/ALLOCATE (; 4 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  call $~lib/runtime/doAllocate
 )
 (func $~lib/runtime/assertUnregistered (; 5 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  global.get $~lib/memory/HEAP_BASE
  i32.gt_u
  i32.eqz
  if
   i32.const 0
   i32.const 16
   i32.const 192
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  global.get $~lib/runtime/HEADER_SIZE
  i32.sub
  i32.load
  global.get $~lib/runtime/HEADER_MAGIC
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 16
   i32.const 193
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/runtime/doRegister (; 6 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  call $~lib/runtime/assertUnregistered
  local.get $0
  global.get $~lib/runtime/HEADER_SIZE
  i32.sub
  local.get $1
  i32.store
  local.get $0
 )
 (func $~lib/memory/memory.fill (; 7 ;) (type $FUNCSIG$viii) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  block $~lib/util/memory/memset|inlined.0
   local.get $2
   i32.eqz
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 1
   i32.sub
   local.get $1
   i32.store8
   local.get $2
   i32.const 2
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 1
   i32.add
   local.get $1
   i32.store8
   local.get $0
   i32.const 2
   i32.add
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 2
   i32.sub
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 3
   i32.sub
   local.get $1
   i32.store8
   local.get $2
   i32.const 6
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 3
   i32.add
   local.get $1
   i32.store8
   local.get $0
   local.get $2
   i32.add
   i32.const 4
   i32.sub
   local.get $1
   i32.store8
   local.get $2
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   i32.const 0
   local.get $0
   i32.sub
   i32.const 3
   i32.and
   local.set $3
   local.get $0
   local.get $3
   i32.add
   local.set $0
   local.get $2
   local.get $3
   i32.sub
   local.set $2
   local.get $2
   i32.const -4
   i32.and
   local.set $2
   i32.const -1
   i32.const 255
   i32.div_u
   local.get $1
   i32.const 255
   i32.and
   i32.mul
   local.set $4
   local.get $0
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 4
   i32.sub
   local.get $4
   i32.store
   local.get $2
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 4
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 8
   i32.add
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 12
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 8
   i32.sub
   local.get $4
   i32.store
   local.get $2
   i32.const 24
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $0
   i32.const 12
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 16
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 20
   i32.add
   local.get $4
   i32.store
   local.get $0
   i32.const 24
   i32.add
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 28
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 24
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 20
   i32.sub
   local.get $4
   i32.store
   local.get $0
   local.get $2
   i32.add
   i32.const 16
   i32.sub
   local.get $4
   i32.store
   i32.const 24
   local.get $0
   i32.const 4
   i32.and
   i32.add
   local.set $3
   local.get $0
   local.get $3
   i32.add
   local.set $0
   local.get $2
   local.get $3
   i32.sub
   local.set $2
   local.get $4
   i64.extend_i32_u
   local.get $4
   i64.extend_i32_u
   i64.const 32
   i64.shl
   i64.or
   local.set $5
   block $break|0
    loop $continue|0
     local.get $2
     i32.const 32
     i32.ge_u
     if
      block
       local.get $0
       local.get $5
       i64.store
       local.get $0
       i32.const 8
       i32.add
       local.get $5
       i64.store
       local.get $0
       i32.const 16
       i32.add
       local.get $5
       i64.store
       local.get $0
       i32.const 24
       i32.add
       local.get $5
       i64.store
       local.get $2
       i32.const 32
       i32.sub
       local.set $2
       local.get $0
       i32.const 32
       i32.add
       local.set $0
      end
      br $continue|0
     end
    end
   end
  end
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (; 8 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  global.get $~lib/runtime/MAX_BYTELENGTH
  i32.gt_u
  if
   i32.const 0
   i32.const 56
   i32.const 24
   i32.const 43
   call $~lib/env/abort
   unreachable
  end
  block $~lib/runtime/ALLOCATE|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/runtime/doAllocate
  end
  local.set $3
  local.get $3
  i32.const 0
  local.get $1
  call $~lib/memory/memory.fill
  block $~lib/runtime/REGISTER<ArrayBuffer>|inlined.0 (result i32)
   local.get $3
   local.set $2
   local.get $2
   i32.const 3
   call $~lib/runtime/doRegister
  end
 )
 (func $~lib/set/Set<i8>#clear (; 9 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<i8>#constructor (; 10 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<i8>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 1
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<i8>#clear
  local.get $0
 )
 (func $~lib/util/hash/hash8 (; 11 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  i32.const -2128831035
  local.get $0
  i32.xor
  i32.const 16777619
  i32.mul
 )
 (func $~lib/set/Set<i8>#find (; 12 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i32.load8_s
       local.get $1
       i32.const 24
       i32.shl
       i32.const 24
       i32.shr_s
       i32.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<i8>#has (; 13 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i8>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 24
   i32.shl
   i32.const 24
   i32.shr_s
   call $~lib/util/hash/hash8
   br $~lib/util/hash/HASH<i8>|inlined.0
  end
  call $~lib/set/Set<i8>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<i8>#rehash (; 14 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<i8>|inlined.1 (result i32)
   i32.const 8
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<i8>|inlined.2 (result i32)
   i32.const 8
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i32.load8_s
       i32.store8
       block $~lib/util/hash/HASH<i8>|inlined.2 (result i32)
        local.get $9
        i32.load8_s
        local.set $11
        local.get $11
        call $~lib/util/hash/hash8
        br $~lib/util/hash/HASH<i8>|inlined.2
       end
       local.get $1
       i32.and
       local.set $11
       local.get $3
       local.get $11
       i32.const 4
       i32.mul
       i32.add
       local.set $12
       local.get $10
       local.get $12
       i32.load
       i32.store offset=4
       local.get $12
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<i8>|inlined.3 (result i32)
        i32.const 8
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<i8>|inlined.4 (result i32)
       i32.const 8
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<i8>#add (; 15 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $~lib/util/hash/HASH<i8>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 24
   i32.shl
   i32.const 24
   i32.shr_s
   call $~lib/util/hash/hash8
   br $~lib/util/hash/HASH<i8>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<i8>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<i8>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $2
   local.get $2
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $5
   end
   block $~lib/set/ENTRY_SIZE<i8>|inlined.5 (result i32)
    i32.const 8
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i32.store8
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $5
   local.get $4
   local.get $5
   i32.load
   i32.store offset=4
   local.get $5
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<i8>#get:size (; 16 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<i8>#delete (; 17 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i8>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 24
   i32.shl
   i32.const 24
   i32.shr_s
   call $~lib/util/hash/hash8
   br $~lib/util/hash/HASH<i8>|inlined.3
  end
  call $~lib/set/Set<i8>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $2
  local.get $0
  i32.load offset=20
  local.tee $5
  local.get $2
  local.get $5
  i32.gt_u
  select
  i32.ge_u
  local.tee $2
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $2
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<i8>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<i8> (; 18 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $~lib/set/Set<i8>#constructor
  local.set $0
  block $break|0
   i32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 100
    i32.lt_s
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i8>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i32.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i32.const 100
    i32.lt_s
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i8>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i32.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i32.const 50
    i32.lt_s
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i8>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i32.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i32.const 50
    i32.lt_s
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i8>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i8>#clear
  local.get $0
  call $~lib/set/Set<i8>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<u8>#clear (; 19 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<u8>#constructor (; 20 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<u8>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 4
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<u8>#clear
  local.get $0
 )
 (func $~lib/set/Set<u8>#find (; 21 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i32.load8_u
       local.get $1
       i32.const 255
       i32.and
       i32.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<u8>#has (; 22 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u8>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 255
   i32.and
   call $~lib/util/hash/hash8
   br $~lib/util/hash/HASH<u8>|inlined.0
  end
  call $~lib/set/Set<u8>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<u8>#rehash (; 23 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<u8>|inlined.1 (result i32)
   i32.const 8
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<u8>|inlined.2 (result i32)
   i32.const 8
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i32.load8_u
       i32.store8
       block $~lib/util/hash/HASH<u8>|inlined.2 (result i32)
        local.get $9
        i32.load8_u
        local.set $11
        local.get $11
        call $~lib/util/hash/hash8
        br $~lib/util/hash/HASH<u8>|inlined.2
       end
       local.get $1
       i32.and
       local.set $11
       local.get $3
       local.get $11
       i32.const 4
       i32.mul
       i32.add
       local.set $12
       local.get $10
       local.get $12
       i32.load
       i32.store offset=4
       local.get $12
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<u8>|inlined.3 (result i32)
        i32.const 8
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<u8>|inlined.4 (result i32)
       i32.const 8
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<u8>#add (; 24 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $~lib/util/hash/HASH<u8>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 255
   i32.and
   call $~lib/util/hash/hash8
   br $~lib/util/hash/HASH<u8>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<u8>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<u8>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $2
   local.get $2
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $5
   end
   block $~lib/set/ENTRY_SIZE<u8>|inlined.5 (result i32)
    i32.const 8
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i32.store8
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $5
   local.get $4
   local.get $5
   i32.load
   i32.store offset=4
   local.get $5
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<u8>#get:size (; 25 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<u8>#delete (; 26 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u8>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 255
   i32.and
   call $~lib/util/hash/hash8
   br $~lib/util/hash/HASH<u8>|inlined.3
  end
  call $~lib/set/Set<u8>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $2
  local.get $0
  i32.load offset=20
  local.tee $5
  local.get $2
  local.get $5
  i32.gt_u
  select
  i32.ge_u
  local.tee $2
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $2
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<u8>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<u8> (; 27 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $~lib/set/Set<u8>#constructor
  local.set $0
  block $break|0
   i32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 100
    i32.lt_u
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u8>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i32.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i32.const 100
    i32.lt_u
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u8>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i32.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i32.const 50
    i32.lt_u
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u8>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i32.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i32.const 50
    i32.lt_u
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u8>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u8>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u8>#clear
  local.get $0
  call $~lib/set/Set<u8>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<i16>#clear (; 28 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<i16>#constructor (; 29 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<i16>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 5
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<i16>#clear
  local.get $0
 )
 (func $~lib/util/hash/hash16 (; 30 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  i32.const -2128831035
  local.set $1
  local.get $1
  local.get $0
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 8
  i32.shr_u
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
 )
 (func $~lib/set/Set<i16>#find (; 31 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i32.load16_s
       local.get $1
       i32.const 16
       i32.shl
       i32.const 16
       i32.shr_s
       i32.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<i16>#has (; 32 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i16>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 16
   i32.shl
   i32.const 16
   i32.shr_s
   call $~lib/util/hash/hash16
   br $~lib/util/hash/HASH<i16>|inlined.0
  end
  call $~lib/set/Set<i16>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<i16>#rehash (; 33 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<i16>|inlined.1 (result i32)
   i32.const 8
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<i16>|inlined.2 (result i32)
   i32.const 8
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i32.load16_s
       i32.store16
       block $~lib/util/hash/HASH<i16>|inlined.2 (result i32)
        local.get $9
        i32.load16_s
        local.set $11
        local.get $11
        call $~lib/util/hash/hash16
        br $~lib/util/hash/HASH<i16>|inlined.2
       end
       local.get $1
       i32.and
       local.set $11
       local.get $3
       local.get $11
       i32.const 4
       i32.mul
       i32.add
       local.set $12
       local.get $10
       local.get $12
       i32.load
       i32.store offset=4
       local.get $12
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<i16>|inlined.3 (result i32)
        i32.const 8
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<i16>|inlined.4 (result i32)
       i32.const 8
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<i16>#add (; 34 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $~lib/util/hash/HASH<i16>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 16
   i32.shl
   i32.const 16
   i32.shr_s
   call $~lib/util/hash/hash16
   br $~lib/util/hash/HASH<i16>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<i16>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<i16>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $2
   local.get $2
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $5
   end
   block $~lib/set/ENTRY_SIZE<i16>|inlined.5 (result i32)
    i32.const 8
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i32.store16
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $5
   local.get $4
   local.get $5
   i32.load
   i32.store offset=4
   local.get $5
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<i16>#get:size (; 35 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<i16>#delete (; 36 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i16>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 16
   i32.shl
   i32.const 16
   i32.shr_s
   call $~lib/util/hash/hash16
   br $~lib/util/hash/HASH<i16>|inlined.3
  end
  call $~lib/set/Set<i16>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $2
  local.get $0
  i32.load offset=20
  local.tee $5
  local.get $2
  local.get $5
  i32.gt_u
  select
  i32.ge_u
  local.tee $2
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $2
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<i16>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<i16> (; 37 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $~lib/set/Set<i16>#constructor
  local.set $0
  block $break|0
   i32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 100
    i32.lt_s
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i16>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i32.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i32.const 100
    i32.lt_s
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i16>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i32.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i32.const 50
    i32.lt_s
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i16>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i32.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i32.const 50
    i32.lt_s
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i16>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i16>#clear
  local.get $0
  call $~lib/set/Set<i16>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<u16>#clear (; 38 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<u16>#constructor (; 39 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<u16>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 6
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<u16>#clear
  local.get $0
 )
 (func $~lib/set/Set<u16>#find (; 40 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i32.load16_u
       local.get $1
       i32.const 65535
       i32.and
       i32.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<u16>#has (; 41 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u16>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 65535
   i32.and
   call $~lib/util/hash/hash16
   br $~lib/util/hash/HASH<u16>|inlined.0
  end
  call $~lib/set/Set<u16>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<u16>#rehash (; 42 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<u16>|inlined.1 (result i32)
   i32.const 8
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<u16>|inlined.2 (result i32)
   i32.const 8
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i32.load16_u
       i32.store16
       block $~lib/util/hash/HASH<u16>|inlined.2 (result i32)
        local.get $9
        i32.load16_u
        local.set $11
        local.get $11
        call $~lib/util/hash/hash16
        br $~lib/util/hash/HASH<u16>|inlined.2
       end
       local.get $1
       i32.and
       local.set $11
       local.get $3
       local.get $11
       i32.const 4
       i32.mul
       i32.add
       local.set $12
       local.get $10
       local.get $12
       i32.load
       i32.store offset=4
       local.get $12
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<u16>|inlined.3 (result i32)
        i32.const 8
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<u16>|inlined.4 (result i32)
       i32.const 8
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<u16>#add (; 43 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $~lib/util/hash/HASH<u16>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 65535
   i32.and
   call $~lib/util/hash/hash16
   br $~lib/util/hash/HASH<u16>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<u16>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<u16>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $2
   local.get $2
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $5
   end
   block $~lib/set/ENTRY_SIZE<u16>|inlined.5 (result i32)
    i32.const 8
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i32.store16
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $5
   local.get $4
   local.get $5
   i32.load
   i32.store offset=4
   local.get $5
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<u16>#get:size (; 44 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<u16>#delete (; 45 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u16>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.const 65535
   i32.and
   call $~lib/util/hash/hash16
   br $~lib/util/hash/HASH<u16>|inlined.3
  end
  call $~lib/set/Set<u16>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $2
  local.get $0
  i32.load offset=20
  local.tee $5
  local.get $2
  local.get $5
  i32.gt_u
  select
  i32.ge_u
  local.tee $2
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $2
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<u16>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<u16> (; 46 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $~lib/set/Set<u16>#constructor
  local.set $0
  block $break|0
   i32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 100
    i32.lt_u
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u16>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i32.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i32.const 100
    i32.lt_u
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u16>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i32.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i32.const 50
    i32.lt_u
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u16>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i32.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i32.const 50
    i32.lt_u
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u16>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u16>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u16>#clear
  local.get $0
  call $~lib/set/Set<u16>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<i32>#clear (; 47 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<i32>#constructor (; 48 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<i32>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 7
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<i32>#clear
  local.get $0
 )
 (func $~lib/util/hash/hash32 (; 49 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  i32.const -2128831035
  local.set $1
  local.get $1
  local.get $0
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 16
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 24
  i32.shr_u
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
 )
 (func $~lib/set/Set<i32>#find (; 50 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i32.load
       local.get $1
       i32.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<i32>#has (; 51 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i32>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<i32>|inlined.0
  end
  call $~lib/set/Set<i32>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<i32>#rehash (; 52 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<i32>|inlined.1 (result i32)
   i32.const 8
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<i32>|inlined.2 (result i32)
   i32.const 8
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i32.load
       i32.store
       block $~lib/util/hash/HASH<i32>|inlined.2 (result i32)
        local.get $9
        i32.load
        local.set $11
        local.get $11
        call $~lib/util/hash/hash32
        br $~lib/util/hash/HASH<i32>|inlined.2
       end
       local.get $1
       i32.and
       local.set $11
       local.get $3
       local.get $11
       i32.const 4
       i32.mul
       i32.add
       local.set $12
       local.get $10
       local.get $12
       i32.load
       i32.store offset=4
       local.get $12
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<i32>|inlined.3 (result i32)
        i32.const 8
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<i32>|inlined.4 (result i32)
       i32.const 8
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<i32>#add (; 53 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $~lib/util/hash/HASH<i32>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<i32>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<i32>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<i32>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $2
   local.get $2
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $5
   end
   block $~lib/set/ENTRY_SIZE<i32>|inlined.5 (result i32)
    i32.const 8
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i32.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $5
   local.get $4
   local.get $5
   i32.load
   i32.store offset=4
   local.get $5
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<i32>#get:size (; 54 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<i32>#delete (; 55 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i32>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<i32>|inlined.3
  end
  call $~lib/set/Set<i32>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $2
  local.get $0
  i32.load offset=20
  local.tee $5
  local.get $2
  local.get $5
  i32.gt_u
  select
  i32.ge_u
  local.tee $2
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $2
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<i32>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<i32> (; 56 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $~lib/set/Set<i32>#constructor
  local.set $0
  block $break|0
   i32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 100
    i32.lt_s
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i32>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i32.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i32.const 100
    i32.lt_s
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i32>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i32.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i32.const 50
    i32.lt_s
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i32>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i32.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i32.const 50
    i32.lt_s
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i32>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i32>#clear
  local.get $0
  call $~lib/set/Set<i32>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<u32>#clear (; 57 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<u32>#constructor (; 58 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<u32>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 8
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<u32>#clear
  local.get $0
 )
 (func $~lib/set/Set<u32>#find (; 59 ;) (type $FUNCSIG$iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i32.load
       local.get $1
       i32.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<u32>#has (; 60 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u32>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<u32>|inlined.0
  end
  call $~lib/set/Set<u32>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<u32>#rehash (; 61 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<u32>|inlined.1 (result i32)
   i32.const 8
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<u32>|inlined.2 (result i32)
   i32.const 8
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i32.load
       i32.store
       block $~lib/util/hash/HASH<u32>|inlined.2 (result i32)
        local.get $9
        i32.load
        local.set $11
        local.get $11
        call $~lib/util/hash/hash32
        br $~lib/util/hash/HASH<u32>|inlined.2
       end
       local.get $1
       i32.and
       local.set $11
       local.get $3
       local.get $11
       i32.const 4
       i32.mul
       i32.add
       local.set $12
       local.get $10
       local.get $12
       i32.load
       i32.store offset=4
       local.get $12
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<u32>|inlined.3 (result i32)
        i32.const 8
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<u32>|inlined.4 (result i32)
       i32.const 8
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<u32>#add (; 62 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $~lib/util/hash/HASH<u32>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<u32>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<u32>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<u32>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $2
   local.get $2
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $5
   end
   block $~lib/set/ENTRY_SIZE<u32>|inlined.5 (result i32)
    i32.const 8
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i32.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $5
   local.get $4
   local.get $5
   i32.load
   i32.store offset=4
   local.get $5
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<u32>#get:size (; 63 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<u32>#delete (; 64 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u32>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<u32>|inlined.3
  end
  call $~lib/set/Set<u32>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $2
  local.get $0
  i32.load offset=20
  local.tee $5
  local.get $2
  local.get $5
  i32.gt_u
  select
  i32.ge_u
  local.tee $2
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $2
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<u32>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<u32> (; 65 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i32)
  i32.const 0
  call $~lib/set/Set<u32>#constructor
  local.set $0
  block $break|0
   i32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i32.const 100
    i32.lt_u
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u32>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i32.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i32.const 100
    i32.lt_u
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u32>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i32.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i32.const 50
    i32.lt_u
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u32>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i32.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i32.const 50
    i32.lt_u
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u32>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u32>#clear
  local.get $0
  call $~lib/set/Set<u32>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<i64>#clear (; 66 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 64
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<i64>#constructor (; 67 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<i64>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 9
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<i64>#clear
  local.get $0
 )
 (func $~lib/util/hash/hash64 (; 68 ;) (type $FUNCSIG$ij) (param $0 i64) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.wrap_i64
  local.set $1
  local.get $0
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $2
  i32.const -2128831035
  local.set $3
  local.get $3
  local.get $1
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
  local.get $1
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
  local.get $1
  i32.const 16
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
  local.get $1
  i32.const 24
  i32.shr_u
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
  local.get $2
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
  local.get $2
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
  local.get $2
  i32.const 16
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
  local.get $2
  i32.const 24
  i32.shr_u
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $3
  local.get $3
 )
 (func $~lib/set/Set<i64>#find (; 69 ;) (type $FUNCSIG$iiji) (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i64.load
       local.get $1
       i64.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=8
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<i64>#has (; 70 ;) (type $FUNCSIG$iij) (param $0 i32) (param $1 i64) (result i32)
  (local $2 i64)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i64>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<i64>|inlined.0
  end
  call $~lib/set/Set<i64>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<i64>#rehash (; 71 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<i64>|inlined.1 (result i32)
   i32.const 16
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<i64>|inlined.2 (result i32)
   i32.const 16
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i64.load
       i64.store
       block $~lib/util/hash/HASH<i64>|inlined.2 (result i32)
        local.get $9
        i64.load
        local.set $11
        local.get $11
        call $~lib/util/hash/hash64
        br $~lib/util/hash/HASH<i64>|inlined.2
       end
       local.get $1
       i32.and
       local.set $12
       local.get $3
       local.get $12
       i32.const 4
       i32.mul
       i32.add
       local.set $13
       local.get $10
       local.get $13
       i32.load
       i32.store offset=8
       local.get $13
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<i64>|inlined.3 (result i32)
        i32.const 16
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<i64>|inlined.4 (result i32)
       i32.const 16
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<i64>#add (; 72 ;) (type $FUNCSIG$vij) (param $0 i32) (param $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/hash/HASH<i64>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<i64>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<i64>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<i64>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $5
   local.get $5
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $6
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $6
   end
   block $~lib/set/ENTRY_SIZE<i64>|inlined.5 (result i32)
    i32.const 16
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i64.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $6
   local.get $4
   local.get $6
   i32.load
   i32.store offset=8
   local.get $6
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<i64>#get:size (; 73 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<i64>#delete (; 74 ;) (type $FUNCSIG$iij) (param $0 i32) (param $1 i64) (result i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<i64>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<i64>|inlined.3
  end
  call $~lib/set/Set<i64>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=8
  i32.const 1
  i32.or
  i32.store offset=8
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $5
  local.get $0
  i32.load offset=20
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_u
  select
  i32.ge_u
  local.tee $5
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $5
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<i64>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<i64> (; 75 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i64)
  i32.const 0
  call $~lib/set/Set<i64>#constructor
  local.set $0
  block $break|0
   i64.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i64.const 100
    i64.lt_s
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i64>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i64.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i64.const 100
    i64.lt_s
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i64>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i64.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i64.const 50
    i64.lt_s
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i64>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i64.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i64.const 50
    i64.lt_s
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<i64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i64>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<i64>#clear
  local.get $0
  call $~lib/set/Set<i64>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<u64>#clear (; 76 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 64
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<u64>#constructor (; 77 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<u64>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 10
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<u64>#clear
  local.get $0
 )
 (func $~lib/set/Set<u64>#find (; 78 ;) (type $FUNCSIG$iiji) (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       i64.load
       local.get $1
       i64.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=8
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<u64>#has (; 79 ;) (type $FUNCSIG$iij) (param $0 i32) (param $1 i64) (result i32)
  (local $2 i64)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u64>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<u64>|inlined.0
  end
  call $~lib/set/Set<u64>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<u64>#rehash (; 80 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<u64>|inlined.1 (result i32)
   i32.const 16
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<u64>|inlined.2 (result i32)
   i32.const 16
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       i64.load
       i64.store
       block $~lib/util/hash/HASH<u64>|inlined.2 (result i32)
        local.get $9
        i64.load
        local.set $11
        local.get $11
        call $~lib/util/hash/hash64
        br $~lib/util/hash/HASH<u64>|inlined.2
       end
       local.get $1
       i32.and
       local.set $12
       local.get $3
       local.get $12
       i32.const 4
       i32.mul
       i32.add
       local.set $13
       local.get $10
       local.get $13
       i32.load
       i32.store offset=8
       local.get $13
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<u64>|inlined.3 (result i32)
        i32.const 16
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<u64>|inlined.4 (result i32)
       i32.const 16
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<u64>#add (; 81 ;) (type $FUNCSIG$vij) (param $0 i32) (param $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/hash/HASH<u64>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<u64>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<u64>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<u64>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $5
   local.get $5
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $6
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $6
   end
   block $~lib/set/ENTRY_SIZE<u64>|inlined.5 (result i32)
    i32.const 16
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   i64.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $6
   local.get $4
   local.get $6
   i32.load
   i32.store offset=8
   local.get $6
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<u64>#get:size (; 82 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<u64>#delete (; 83 ;) (type $FUNCSIG$iij) (param $0 i32) (param $1 i64) (result i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<u64>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<u64>|inlined.3
  end
  call $~lib/set/Set<u64>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=8
  i32.const 1
  i32.or
  i32.store offset=8
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $5
  local.get $0
  i32.load offset=20
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_u
  select
  i32.ge_u
  local.tee $5
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $5
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<u64>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<u64> (; 84 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 i64)
  i32.const 0
  call $~lib/set/Set<u64>#constructor
  local.set $0
  block $break|0
   i64.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    i64.const 100
    i64.lt_u
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u64>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   i64.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    i64.const 100
    i64.lt_u
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u64>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   i64.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    i64.const 50
    i64.lt_u
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u64>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   i64.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    i64.const 50
    i64.lt_u
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<u64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u64>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<u64>#clear
  local.get $0
  call $~lib/set/Set<u64>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<f32>#clear (; 85 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<f32>#constructor (; 86 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<f32>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 11
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<f32>#clear
  local.get $0
 )
 (func $~lib/set/Set<f32>#find (; 87 ;) (type $FUNCSIG$iifi) (param $0 i32) (param $1 f32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       f32.load
       local.get $1
       f32.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=4
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<f32>#has (; 88 ;) (type $FUNCSIG$iif) (param $0 i32) (param $1 f32) (result i32)
  (local $2 f32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<f32>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.reinterpret_f32
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<f32>|inlined.0
  end
  call $~lib/set/Set<f32>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<f32>#rehash (; 89 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 f32)
  (local $12 i32)
  (local $13 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<f32>|inlined.1 (result i32)
   i32.const 8
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<f32>|inlined.2 (result i32)
   i32.const 8
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       f32.load
       f32.store
       block $~lib/util/hash/HASH<f32>|inlined.2 (result i32)
        local.get $9
        f32.load
        local.set $11
        local.get $11
        i32.reinterpret_f32
        call $~lib/util/hash/hash32
        br $~lib/util/hash/HASH<f32>|inlined.2
       end
       local.get $1
       i32.and
       local.set $12
       local.get $3
       local.get $12
       i32.const 4
       i32.mul
       i32.add
       local.set $13
       local.get $10
       local.get $13
       i32.load
       i32.store offset=4
       local.get $13
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<f32>|inlined.3 (result i32)
        i32.const 8
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<f32>|inlined.4 (result i32)
       i32.const 8
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<f32>#add (; 90 ;) (type $FUNCSIG$vif) (param $0 i32) (param $1 f32)
  (local $2 f32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/hash/HASH<f32>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.reinterpret_f32
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<f32>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<f32>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<f32>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $5
   local.get $5
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $6
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $6
   end
   block $~lib/set/ENTRY_SIZE<f32>|inlined.5 (result i32)
    i32.const 8
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   f32.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $6
   local.get $4
   local.get $6
   i32.load
   i32.store offset=4
   local.get $6
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<f32>#get:size (; 91 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<f32>#delete (; 92 ;) (type $FUNCSIG$iif) (param $0 i32) (param $1 f32) (result i32)
  (local $2 f32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<f32>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i32.reinterpret_f32
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<f32>|inlined.3
  end
  call $~lib/set/Set<f32>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.or
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $5
  local.get $0
  i32.load offset=20
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_u
  select
  i32.ge_u
  local.tee $5
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $5
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<f32>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<f32> (; 93 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 f32)
  i32.const 0
  call $~lib/set/Set<f32>#constructor
  local.set $0
  block $break|0
   f32.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    f32.const 100
    f32.lt
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f32.const 1
    f32.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f32>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   f32.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    f32.const 100
    f32.lt
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f32.const 1
    f32.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f32>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   f32.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    f32.const 50
    f32.lt
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f32.const 1
    f32.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f32>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   f32.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    f32.const 50
    f32.lt
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<f32>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f32.const 1
    f32.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f32>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f32>#clear
  local.get $0
  call $~lib/set/Set<f32>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $~lib/set/Set<f64>#clear (; 94 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.const 64
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/set/Set<f64>#constructor (; 95 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  block (result i32)
   local.get $0
   i32.eqz
   if
    block $~lib/runtime/REGISTER<Set<f64>>|inlined.0 (result i32)
     i32.const 24
     call $~lib/runtime/ALLOCATE
     local.set $1
     local.get $1
     i32.const 12
     call $~lib/runtime/doRegister
    end
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
  end
  call $~lib/set/Set<f64>#clear
  local.get $0
 )
 (func $~lib/set/Set<f64>#find (; 96 ;) (type $FUNCSIG$iidi) (param $0 i32) (param $1 f64) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  block $break|0
   loop $continue|0
    local.get $3
    if
     block
      local.get $3
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      local.tee $4
      if (result i32)
       local.get $3
       f64.load
       local.get $1
       f64.eq
      else       
       local.get $4
      end
      if
       local.get $3
       return
      end
      local.get $3
      i32.load offset=8
      i32.const 1
      i32.const -1
      i32.xor
      i32.and
      local.set $3
     end
     br $continue|0
    end
   end
  end
  i32.const 0
 )
 (func $~lib/set/Set<f64>#has (; 97 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  (local $2 f64)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<f64>|inlined.0 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i64.reinterpret_f64
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<f64>|inlined.0
  end
  call $~lib/set/Set<f64>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/set/Set<f64>#rehash (; 98 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 f64)
  (local $12 i32)
  (local $13 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  f64.convert_i32_s
  f64.const 2.6666666666666665
  f64.mul
  i32.trunc_f64_s
  local.set $4
  i32.const 0
  local.get $4
  block $~lib/set/ENTRY_SIZE<f64>|inlined.1 (result i32)
   i32.const 16
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  block $~lib/set/ENTRY_SIZE<f64>|inlined.2 (result i32)
   i32.const 16
  end
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  block $break|0
   loop $continue|0
    local.get $6
    local.get $7
    i32.ne
    if
     block
      local.get $6
      local.set $9
      local.get $9
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $8
       local.set $10
       local.get $10
       local.get $9
       f64.load
       f64.store
       block $~lib/util/hash/HASH<f64>|inlined.2 (result i32)
        local.get $9
        f64.load
        local.set $11
        local.get $11
        i64.reinterpret_f64
        call $~lib/util/hash/hash64
        br $~lib/util/hash/HASH<f64>|inlined.2
       end
       local.get $1
       i32.and
       local.set $12
       local.get $3
       local.get $12
       i32.const 4
       i32.mul
       i32.add
       local.set $13
       local.get $10
       local.get $13
       i32.load
       i32.store offset=8
       local.get $13
       local.get $8
       i32.store
       local.get $8
       block $~lib/set/ENTRY_SIZE<f64>|inlined.3 (result i32)
        i32.const 16
       end
       i32.add
       local.set $8
      end
      local.get $6
      block $~lib/set/ENTRY_SIZE<f64>|inlined.4 (result i32)
       i32.const 16
      end
      i32.add
      local.set $6
     end
     br $continue|0
    end
   end
  end
  local.get $0
  local.get $3
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $5
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<f64>#add (; 99 ;) (type $FUNCSIG$vid) (param $0 i32) (param $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/hash/HASH<f64>|inlined.1 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i64.reinterpret_f64
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<f64>|inlined.1
  end
  local.set $3
  local.get $0
  local.get $1
  local.get $3
  call $~lib/set/Set<f64>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    f64.convert_i32_s
    f64.const 0.75
    f64.mul
    i32.trunc_f64_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else     
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<f64>#rehash
   end
   local.get $0
   i32.load offset=8
   local.set $5
   local.get $5
   block (result i32)
    local.get $0
    local.get $0
    i32.load offset=16
    local.tee $6
    i32.const 1
    i32.add
    i32.store offset=16
    local.get $6
   end
   block $~lib/set/ENTRY_SIZE<f64>|inlined.5 (result i32)
    i32.const 16
   end
   i32.mul
   i32.add
   local.set $4
   local.get $4
   local.get $1
   f64.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $6
   local.get $4
   local.get $6
   i32.load
   i32.store offset=8
   local.get $6
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<f64>#get:size (; 100 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/set/Set<f64>#delete (; 101 ;) (type $FUNCSIG$iid) (param $0 i32) (param $1 f64) (result i32)
  (local $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<f64>|inlined.3 (result i32)
   local.get $1
   local.set $2
   local.get $2
   i64.reinterpret_f64
   call $~lib/util/hash/hash64
   br $~lib/util/hash/HASH<f64>|inlined.3
  end
  call $~lib/set/Set<f64>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $3
  i32.load offset=8
  i32.const 1
  i32.or
  i32.store offset=8
  local.get $0
  local.get $0
  i32.load offset=20
  i32.const 1
  i32.sub
  i32.store offset=20
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.shr_u
  local.set $4
  local.get $4
  i32.const 1
  i32.add
  i32.const 4
  local.tee $5
  local.get $0
  i32.load offset=20
  local.tee $6
  local.get $5
  local.get $6
  i32.gt_u
  select
  i32.ge_u
  local.tee $5
  if (result i32)
   local.get $0
   i32.load offset=20
   local.get $0
   i32.load offset=12
   f64.convert_i32_s
   f64.const 0.75
   f64.mul
   i32.trunc_f64_s
   i32.lt_s
  else   
   local.get $5
  end
  if
   local.get $0
   local.get $4
   call $~lib/set/Set<f64>#rehash
  end
  i32.const 1
 )
 (func $std/set/test<f64> (; 102 ;) (type $FUNCSIG$v)
  (local $0 i32)
  (local $1 f64)
  i32.const 0
  call $~lib/set/Set<f64>#constructor
  local.set $0
  block $break|0
   f64.const 0
   local.set $1
   loop $repeat|0
    local.get $1
    f64.const 100
    f64.lt
    i32.eqz
    br_if $break|0
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 8
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 10
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f64.const 1
    f64.add
    local.set $1
    br $repeat|0
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f64>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 12
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|1
   f64.const 50
   local.set $1
   loop $repeat|1
    local.get $1
    f64.const 100
    f64.lt
    i32.eqz
    br_if $break|1
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 16
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 18
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f64.const 1
    f64.add
    local.set $1
    br $repeat|1
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f64>#get:size
  i32.const 100
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 20
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|2
   f64.const 0
   local.set $1
   loop $repeat|2
    local.get $1
    f64.const 50
    f64.lt
    i32.eqz
    br_if $break|2
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 24
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 26
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f64.const 1
    f64.add
    local.set $1
    br $repeat|2
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f64>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 28
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  block $break|3
   f64.const 0
   local.set $1
   loop $repeat|3
    local.get $1
    f64.const 50
    f64.lt
    i32.eqz
    br_if $break|3
    block
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 32
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#add
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 34
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#delete
     drop
     local.get $0
     local.get $1
     call $~lib/set/Set<f64>#has
     i32.eqz
     i32.eqz
     if
      i32.const 0
      i32.const 104
      i32.const 36
      i32.const 4
      call $~lib/env/abort
      unreachable
     end
    end
    local.get $1
    f64.const 1
    f64.add
    local.set $1
    br $repeat|3
    unreachable
   end
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f64>#get:size
  i32.const 50
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 38
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
  local.get $0
  call $~lib/set/Set<f64>#clear
  local.get $0
  call $~lib/set/Set<f64>#get:size
  i32.const 0
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 104
   i32.const 42
   i32.const 2
   call $~lib/env/abort
   unreachable
  end
 )
 (func $start:std/set (; 103 ;) (type $FUNCSIG$v)
  global.get $~lib/memory/HEAP_BASE
  i32.const 7
  i32.add
  i32.const 7
  i32.const -1
  i32.xor
  i32.and
  global.set $~lib/allocator/arena/startOffset
  global.get $~lib/allocator/arena/startOffset
  global.set $~lib/allocator/arena/offset
  call $std/set/test<i8>
  call $std/set/test<u8>
  call $std/set/test<i16>
  call $std/set/test<u16>
  call $std/set/test<i32>
  call $std/set/test<u32>
  call $std/set/test<i64>
  call $std/set/test<u64>
  call $std/set/test<f32>
  call $std/set/test<f64>
 )
 (func $start (; 104 ;) (type $FUNCSIG$v)
  call $start:std/set
 )
 (func $null (; 105 ;) (type $FUNCSIG$v)
 )
)
